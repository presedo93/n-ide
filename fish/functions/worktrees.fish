function _git_worktree_path
    set -l repo_root $argv[1]
    set -l branch_name $argv[2]
    set -l safe_branch_name (string replace -a "/" "__" "$branch_name")
    echo "$repo_root/.worktrees/$safe_branch_name"
end

function gh_review_worktree
    set -l pr_number $argv[1]

    if test -z "$pr_number"
        echo "usage: gh_review_worktree <pr_number>" >&2
        return 1
    end

    set -l repo_root (git rev-parse --show-toplevel 2>/dev/null)
    if test -z "$repo_root"
        echo "Not inside a git repository" >&2
        return 1
    end

    set -l branch_name (gh pr view "$pr_number" --json headRefName --jq '.headRefName' 2>/dev/null)
    if test -z "$branch_name"
        echo "Could not determine PR head branch for PR #$pr_number" >&2
        return 1
    end

    set -l worktree_path (_git_worktree_path "$repo_root" "$branch_name")

    mkdir -p "$repo_root/.worktrees"; or return 1

    if test -d "$worktree_path"
        # reuse existing worktree
    else
        git fetch origin "pull/$pr_number/head:$branch_name"; or return 1
        git worktree add "$worktree_path" "$branch_name"; or return 1

        # configure upstream tracking so Octo recognises the PR branch
        git -C "$worktree_path" config "branch.$branch_name.remote" origin
        git -C "$worktree_path" config "branch.$branch_name.merge" "refs/heads/$branch_name"
    end

    nvim --cmd "cd $worktree_path" -c "Octo pr edit $pr_number"

    # clean up worktree and local branch after nvim exits
    read -l -P "Remove worktree and branch '$branch_name'? [y/N] " confirm
    if test "$confirm" = y -o "$confirm" = Y
        git worktree remove --force "$worktree_path" 2>/dev/null
        git branch -D "$branch_name" 2>/dev/null
    end
end

function gh_create_worktree
    set -l branch_name $argv[1]

    if test -z "$branch_name"
        echo "usage: gh_create_worktree <branch_name>" >&2
        return 1
    end

    set -l repo_root (git rev-parse --show-toplevel 2>/dev/null)
    if test -z "$repo_root"
        echo "Not inside a git repository" >&2
        return 1
    end

    set -l worktree_path (_git_worktree_path "$repo_root" "$branch_name")

    if test -d "$worktree_path"
        echo "Worktree already exists: $worktree_path" >&2
        return 1
    end

    mkdir -p "$repo_root/.worktrees"; or return 1
    git worktree add -b "$branch_name" "$worktree_path"; or return 1

    echo "Created worktree: $worktree_path"
end
