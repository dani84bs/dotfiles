# === TIDE PROMPT CONFIGURATION ===

# General setup
set -g tide_prompt_add_newline_before false
set -g tide_prompt_color_frame_and_connection 808080
set -g tide_prompt_color_separator_same_color 949494
set -g tide_prompt_icon_connection ─
set -g tide_prompt_min_cols 34
set -g tide_prompt_pad_items true
set -g tide_prompt_transient_enabled false

# Left Prompt Items
set -g tide_left_prompt_frame_enabled true
set -g tide_left_prompt_items pwd git newline character
set -g tide_left_prompt_prefix 
set -g tide_left_prompt_separator_diff_color 
set -g tide_left_prompt_separator_same_color 
set -g tide_left_prompt_suffix 

# Right Prompt Items
set -g tide_right_prompt_frame_enabled false
set -g tide_right_prompt_items status cmd_duration context jobs direnv node python rustc java php pulumi ruby go gcloud kubectl distrobox toolbox terraform aws crystal elixir zig
set -g tide_right_prompt_prefix 
set -g tide_right_prompt_separator_diff_color 
set -g tide_right_prompt_separator_same_color 
set -g tide_right_prompt_suffix 

# Colors and Icons for Core Components (PWD, Git, Status)
set -g tide_pwd_bg_color 3465A4
set -g tide_pwd_color_anchors E4E4E4
set -g tide_pwd_color_dirs E4E4E4
set -g tide_pwd_color_truncated_dirs BCBCBC
set -g tide_pwd_icon 
set -g tide_pwd_icon_home 
set -g tide_pwd_icon_unwritable 
set -g tide_pwd_markers .bzr .citc .git .hg .node-version .python-version .ruby-version .shorten_folder_marker .svn .terraform Cargo.toml composer.json CVS go.mod package.json build.zig

set -g tide_git_bg_color 4E9A06
set -g tide_git_bg_color_unstable C4A000
set -g tide_git_bg_color_urgent CC0000
set -g tide_git_color_branch 000000
set -g tide_git_icon 
set -g tide_git_truncation_length 24

set -g tide_status_bg_color 2E3436
set -g tide_status_bg_color_failure CC0000
set -g tide_status_color 4E9A06
set -g tide_status_color_failure FFFF00
set -g tide_status_icon ✔
set -g tide_status_icon_failure ✘

# Tooling and Language specific settings
set -g tide_rustc_bg_color F74C00
set -g tide_rustc_icon 
set -g tide_python_bg_color 444444
set -g tide_python_color 00AFAF
set -g tide_python_icon \U000f0320

# VI Mode and Character settings
set -g tide_character_color 5FD700
set -g tide_character_color_failure FF0000
set -g tide_character_icon ❯
set -g tide_vi_mode_bg_color_default 949494
set -g tide_vi_mode_bg_color_insert 87AFAF
set -g tide_vi_mode_bg_color_visual FF8700

# Command Duration settings
set -g tide_cmd_duration_bg_color C4A000
set -g tide_cmd_duration_color 000000
set -g tide_cmd_duration_threshold 3000
set -g tide_cmd_duration_icon 
