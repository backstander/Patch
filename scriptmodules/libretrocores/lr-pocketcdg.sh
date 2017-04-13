#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-pocketcdg"
rp_module_desc="PocketCDG - Karaoke Player for libretro"
rp_module_help="ROM Extensions: .cdg\n\nCopy your CDG and matching MP3 files to $romdir/karaoke"
rp_module_licence="GPL2"
rp_module_section="exp"
rp_module_flags=""

function sources_lr-pocketcdg() {
    gitPullOrClone "$md_build" https://github.com/libretro/libretro-pocketcdg.git
}

function build_lr-pocketcdg() {
    make clean
    make platform="unix"
    md_ret_require="$md_build/pocketcdg_libretro.so"
}

function install_lr-pocketcdg() {
    md_ret_files=(     
        'pocketcdg_libretro.so'
    )
}

function configure_lr-pocketcdg() {
    mkRomDir "karaoke"
 #  ensureSystemretroconfig "karaoke"

    addEmulator 1 "$md_id" "karaoke" "$md_inst/pocketcdg_libretro.so"
    addSystem "karaoke" "PocketCDG karaoke" ".cdg"
}
