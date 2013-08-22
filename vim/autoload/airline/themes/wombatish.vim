" Normal mode
let s:N1 = [ '#005f00' , '#afd700' , 22  , 148 ]
let s:N2 = [ '#9e9e9e' , '#303030' , 247 , 239 ]
let s:N3 = [ '#ffffff' , '#121212' , 242 , 236 ]

" Insert mode
let s:I1 = [ '#005f5f' , '#ffffff' , 23  , 231 ]
let s:I2 = [ '#5fafd7' , '#0087af' , 74  , 31  ]
let s:I3 = [ '#87d7ff' , '#005f87' , 117 , 24  ]

" Visual mode
let s:V1 = [ '#080808' , '#ffaf00' , 232 , 214 ]

" Replace mode
let s:RE = [ '#ffffff' , '#d70000' , 231 , 160 ]

let s:file = copy(s:N3)

let g:airline#themes#wombatish#palette = {}

let g:airline#themes#wombatish#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3, s:file)

let g:airline#themes#wombatish#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3, s:file)
let g:airline#themes#wombatish#palette.insert_replace = {
      \ 'airline_a': [ s:RE[0]   , s:I1[1]   , s:RE[1]   , s:I1[3]   , ''     ] }

let g:airline#themes#wombatish#palette.visual = {
      \ 'airline_a': [ s:V1[0]   , s:V1[1]   , s:V1[2]   , s:V1[3]   , ''     ] }

let g:airline#themes#wombatish#palette.replace = copy(airline#themes#wombatish#palette.normal)
let g:airline#themes#wombatish#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '' ]


let s:IA = [ s:N2[1] , s:N3[1] , s:N2[3] , s:N3[3] , '' ]
let g:airline#themes#wombatish#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA, s:file)

