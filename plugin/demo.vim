function! Hello() "首字母需要大写
    echom "Hello world.."
endfunction

function! HelloName(Name)
    echom  "[". a:Name . "] is ok !!!"
endfunction
