" This file is auto-generated by shipwright.nvim
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [ [ "#7BA9C5", "#3B5362", "bold" ], [ "#7BA9C5", "#2B3E49" ] ]
let s:p.normal.middle = [ [ "#C6D5CF", "#1C2A32" ] ]
let s:p.normal.right = [ [ "#7BA9C5", "#2B3E49" ], [ "#7BA9C5", "#2B3E49" ] ]
let s:p.normal.warning = [ [ "#B77E64", "#221F1E" ] ]
let s:p.normal.error = [ [ "#DE6E7C", "#251E1E" ] ]

let s:p.inactive.left =  [ [ "#D1E0DA", "#18252D" ], [ "#D1E0DA", "#18252D" ] ]
let s:p.inactive.middle = [ [ "#D1E0DA", "#18252D" ] ]
let s:p.inactive.right = [ [ "#D1E0DA", "#18252D" ] ]

let s:p.insert.left = [ [ "#7BA9C5", "#343F6D", "bold" ], [ "#7BA9C5", "#2B3E49" ] ]
let s:p.replace.left = [ [ "#7BA9C5", "#3B2023", "bold" ], [ "#7BA9C5", "#2B3E49" ] ]
let s:p.visual.left = [ [ "#7BA9C5", "#3A3E3D", "bold" ], [ "#7BA9C5", "#2B3E49" ] ]

let s:p.tabline.left = [ [ "#C6D5CF", "#2B3E49", "italic" ] ]
let s:p.tabline.middle = [ [ "#D1E0DA", "#18252D" ] ]
let s:p.tabline.right = [ [ "#C6D5CF", "#2B3E49" ] ]
let s:p.tabline.tabsel = [ [ "#C6D5CF", "#0F191F", "bold" ] ]

let g:lightline#colorscheme#neobones_dark#palette = lightline#colorscheme#fill(s:p)