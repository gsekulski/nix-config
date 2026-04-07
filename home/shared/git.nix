{ config, pkgs, identity, ... }:

{
  programs.git = {
    enable = true;

    signing = {
      key = identity.gpgKeyId;
      signByDefault = true;
    };

    settings = {
      user.name = identity.fullName;
      user.email = identity.email;

      url."git@github.com:".insteadOf = "gh:";
      url."git@gitlab.com:".insteadOf = "gl:";
      url."git@git.sr.ht:".insteadOf = "sh:";

      init.defaultBranch = "main";
      merge.tool = "vim -d";
      pull.ff = "only";
      pull.rebase = false;
      push.default = "simple";

      diff.algorithm = "histogram";
      diff.colorMoved = "default";
      diff.compactionHeuristic = true;

      rebase.autosquash = true;
      rebase.autostash = true;
      rebase.updateRefs = true;

      branch.sort = "-committerdate";

      help.autocorrect = 2;
      protocol.version = 2;
      color.ui = true;

      core.autocrlf = "input";
      core.safecrlf = false;

      tag.gpgSign = true;
      commit.gpgSign = true;
      commit.signoff = true;
      commit.verbose = true;

      alias = {
        a = "add";
        c = "commit -s";
        d = "diff";
        s = "status";
        co = "checkout";
        cp = "cherry-pick";
        br = "branch";
        f = "push --force-with-lease";

        lg = "log --oneline";
        last = "log -1 HEAD";
        last-commit-to = "log -n 1 --pretty=format:%H";

        ss = "!f() { git stash show stash^{/$*} -p; }; f";
        sa = "!f() { git stash apply stash^{/$*}; }; f";
        sl = "stash list";

        fixes = "show -s --pretty='format:Fixes: %h (\"%s\")'";

        shwo = "show";
        grpe = "grep";
        lgo = "log";
        git = "!exec git";
        gti = "!exec git";
      };
    };
  };
}
