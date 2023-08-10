import 'package:dart_pre_commit/dart_pre_commit.dart';
import 'package:git_hooks/git_hooks.dart';
import 'package:process_run/shell.dart';

void main(List<String> arguments) {
  Map<Git, UserBackFun> params = {
    Git.commitMsg: _conventionalCommitMsg,
    Git.preCommit: _preCommit,
  };
  GitHooks.call(arguments, params);
}

final logger = ConsoleLogger();

Future<bool> _preCommit() async {
  // Run dart_pre_commit package function to auto run various flutter commands
  final result = await DartPreCommit.run();
  if (!result.isSuccess) {
    logger.error('''
      🛑 If you have any question or struggle about pre-commit check process
      Your can read more at: https://pub.dev/packages/dart_pre_commit#configuration
    ''');
  }
  bool importSorterResult = false;
  try {
    var shell = Shell();
    await shell.run('''
      dart run import_sorter:main
      git add -u
    ''');
    logger.info('✅ Import sorter successful');
    importSorterResult = true;
  } catch (e) {
    logger.error('🛑 Error:: $e');
    logger.error(
        '🛑 Your can read more at: https://pub.dev/packages/import_sorter');
    importSorterResult = false;
  }
  return result.isSuccess && importSorterResult;
}

Future<bool> _conventionalCommitMsg() async {
  var commitMsg = Utils.getCommitEditMsg();
  RegExp conventionCommitPattern = RegExp(
      r'''^(feat|fix|refactor|build|chore|perf|ci|docs|revert|style|test|merge){1}(\([\w\-\.]+\))?(!)?:( )?([\w ])+([\s\S]*)''');

  // Check if it matches conventional commit
  if (conventionCommitPattern.hasMatch(commitMsg)) {
    return true; // you can return true let commit go

    // If failed, check if issue is due to invalid tag
  } else if (!RegExp(
          r'(feat|fix|refactor|build|chore|perf|ci|docs|revert|style|test|merge)')
      .hasMatch(commitMsg)) {
    logger.error(
        '🛑 Invalid type used in commit message. It should be one of (feat|fix|refactor|build|chore|perf|ci|docs|revert|style|test|merge)');

    // else refer the dev to conventional commit site
  } else {
    logger.error(
        '🛑 Commit message should follow conventional commit pattern: https://www.conventionalcommits.org/en/v1.0.0/');
  }

  return false;
}
