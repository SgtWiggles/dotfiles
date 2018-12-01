function moveup
	../
	commandline -f repaint
end

function moveback
	prevd
	commandline -f repaint
end
function movefor
	nextd
	commandline -f repaint
end


function fish_user_key_bindings
bind -M insert  \cH 'backward-kill-bigword'
bind  L 'forward-word'
bind  H 'backward-word'
bind \eu moveup
bind \e- moveup
bind \e= movefor

bind \ed moveback
bind \ef movefor
bind -M insert \ed moveback
bind -M insert \ef movefor
bind -M insert \eu moveup

bind -M insert \e- moveup
bind -M insert \e= movefor

end
