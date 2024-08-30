
" diablo syntax file for vim
" $Id: diablo.vim,v 1.22 2014/06/18 19:28:15 hodge3 Exp $
" Language: diablo input file
" Maintainer: Neil Hodge (hodge3@llnl.gov)
"


"
" INSTRUCTIONS
"
" To use this file, you need to set up vim so that it sets the file
" format appropriately on startup.  The easiest way to do this is to
" detect the filename.  Put the code between the lines of hashes
" in your vim startup file (either .vimrc or .gvimrc), and it should work
" fine (at least back to version 6.1, and for both unix and windows
" versions).  NOTE: Be sure to uncomment the lines starting with "au".
"
" ##### START HERE #######################################################
"
" Detect diablo files and treat appropriately
"
"au BufNewFile,BufRead *.assembly set filetype=diablo
"au BufNewFile,BufRead *.subassembly set filetype=diablo
"
" #####  END HERE  #######################################################
"
" For debugging, you can use the command
"
" set ft?
"
" to check what filetype was actually set.
"
" Alternately, you can use the command
"
" setf diablo
"
" to enable the syntax highlighting.
"
" In addition, this file needs to be in the right location, as follows:
"
" unix: ~/.vim/syntax/diablo.vim
"       /usr/local/share/vim/vim61/syntax/diablo.vim
"
" windows: c:\vim\vimfiles\syntax\diablo.vim, or
"          c:\vim\vim6.2\syntax\diablo.vim
"
" The final location of the "syntax" directory could be different depending
" on how you compiled or installed vim.  The directories shown above are
" defaults for the user directory and then the system directory, respectively.
" Use the commands
"
" :version
"
" and
"
" :echo $VIMRUNTIME
" :echo $HOME
"
" to figure out where your directories are.
"
" In addition (from the vim help files):
"
" ########################################################################
"
" NOTE: The syntax files on MS-DOS and Windows have lines that end in <CR><NL>.
" The files for Unix end in <NL>.  This means you should use the right type of
" file for your system.  Although on MS-DOS and Windows the right format is
" automatically selected if the 'fileformats' option is not empty.
"
" ########################################################################
"
" so beware.
"


"
" NOTES
"
" The following help text is quoted from "syn-define":
"
" ########################################################################
"
" In case more than one item matches at the same position, the one that was
" defined LAST wins.  Thus you can override previously defined syntax items by
" using an item that matches the same text.  But a keyword always goes before a
" match or region.  And a keyword with matching case always goes before a
" keyword with ignoring case.
"
" ########################################################################
"
" Depending on how this works out, it may be prudent to switch all keyword
" definitions to matches or regions, to eliminate precedence issues.
"
" As a diagnostic tool, check out tip #99 at vim.org, at the following
" location:
"
" http://www.vim.org/tips/tip.php?tip_id=99
"

"
" Version 5.x: Clear previously defined syntax
" Version 6.x: Quit if a syntax is already defined
"
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif


"
" diablo is not case dependent
"
syn case ignore


"
" If you dislike tabs as much as me . . .
"
syn match dTab "^\t.*$"
syn match dTab "\t"


"
" Comments and free-form strings
"
syn match dComment "\$.*$"
syn region dComment start="\$\$" end="\$\$"
syn region dString start="\'" end="\'"
syn region dString start="\"" end="\""


"
" Keywords
"
syn match dKeyword "^\s*#[a-zA-Z0-9\_\.]\+"
syn match dStartEnd "^\s*#\(start\|end\)[a-zA-Z0-9\_\.]\+$"

"
" Numeric constants, taken from fortran.vim
"
" Integers
syn match dNumber "\<\d\+[ij]\=\>"
" Floating point number, with dot, optional exponent
syn match dNumber "\<\d\+\(\.\d*\)\=\([edED][-+]\=\d\+\)\=[ij]\=\>"
" Floating point number, starting with a dot, optional exponent
syn match dNumber "\.\d\+\([edED][-+]\=\d\+\)\=[ij]\=\>"

" Booleans
syn match dBoolean "[ ]\.FALSE\.\s*\$*" contains=dComment
syn match dBoolean "[ ]F\s*\(\$\|\$.\+\)*\s*$" contains=dComment
syn match dBoolean "[ ]\.TRUE\.\s*\$*" contains=dComment
syn match dBoolean "[ ]T\s*\(\$\|\$.\+\)*\s*$" contains=dComment

" Various diablo parameters
syn match dType "ASCII"
syn match dType "AUTO"
syn match dType "BFGS"
syn match dType "BOOMER"
syn match dType "BOOMER_AMG"
syn match dType "BOOMERAMG"
syn match dType "BOTH"
syn match dType "BROYDEN"
syn match dType "DISPLACEMENT"
syn match dType "DYNAMIC"
syn match dType "ENERGY"
syn match dType "EQUAL_ELEM"
syn match dType "FILM_TEMPERATURE"
syn match dType "FIXED"
syn match dType "FREEZING_ONLY"
syn match dType "FULL"
syn match dType "FULL_NEWTON"
syn match dType "GENERALIZED_TRAPEZOIDAL"
syn match dType "GMRES"
syn match dType "GOLDAK"
syn match dType "GUSAROV"
syn match dType "HDF"
syn match dType "HEAT_FLUX"
syn match dType "HEX8"
syn match dType "HYPRE"
syn match dType "ITAPS"
syn match dType "L2"
syn match dType "LINE2"
syn match dType "MASTER"
syn match dType "MELTING_ONLY"
syn match dType "MIN"
syn match dType "MINIMUM"
syn match dType "MIBL"
syn match dType "MILI"
syn match dType "MORTAR"
syn match dType "MULTIMECH_STAGGERED"
syn match dType "MULTIMECH_BFGS"
syn match dType "MUST_POINT"
syn match dType "NEWMARK"
syn match dType "NIKE3D"
syn match dType "NODE_ON_SEGMENT"
syn match dType "NONE"
syn match dType "NONSYMMETRIC"
syn match dType "PARASAILS"
syn match dType "PCG"
syn match dType "POINT"
syn match dType "QUAD4"
syn match dType "ROTATION"
syn match dType "[ ]RX"
syn match dType "[ ]RY"
syn match dType "[ ]RZ"
syn match dType "SCALING_CURVE"
syn match dType "SILO"
syn match dType "SLAVE"
syn match dType "STATIC"
syn match dType "STRESS"
syn match dType "STRESS_LINE2_HL"
syn match dType "STRESS_QUAD4_HL"
syn match dType "STRESS_HEX8_BBAR_INT"
syn match dType "TEMPERATURE"
syn match dType "THERMAL"
syn match dType "THERMAL_HEX8_FULL_INT"
syn match dType "THERMAL_QUAD4_FULL_INT"
syn match dType "TIME"
syn match dType "UNIFORM"
syn match dType "UNIFORM_DENSITY"
syn match dType "UNIFORM_REL_NORM"
syn match dType "VARIABLE_AUTO"
syn match dType "VARIABLE_MANUAL"
syn match dType "WSMP"
syn match dType "\(X \|X$\)"
syn match dType "XML"
syn match dType "\(Y \|Y$\)"
syn match dType "\(Z \|Z$\)"
syn match dType "ZIENKIEWICZ_ZHU"


"
" Link all of the "d" groups to various standard groups
"
if version >= 508 || !exists("did_diablo_syntax_inits")
    if version < 508
        let did_diablo_syntax_inits = 1
        command -nargs=+ HiLink hi def link <args>
    else
        command -nargs=+ HiLink hi def link <args>
    endif
    "
    " Check out
    " :help group-name
    " for the default groups
    "
    HiLink dStartEnd       Special
    HiLink dKeyword        Keyword
    HiLink dString         String
    HiLink dNumber         Number
    HiLink dBoolean        Boolean
    HiLink dType           Type
    HiLink dComment        Comment
    HiLink dTab            Underlined
    delcommand HiLink
endif


"
" This guarantees correct highlight parsing when moving through the file;
" since diablo files can be fairly large, this might slow things down
" too much . . .
"
syn sync fromstart

let b:current_syntax = "diablo"

