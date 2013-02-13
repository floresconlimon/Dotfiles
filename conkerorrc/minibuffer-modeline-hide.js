var minibuffer_autohide_with_mode_line = true;

function hide_minibuffer (window) {
    window.minibuffer.element.collapsed = true;
    if (minibuffer_autohide_with_mode_line && window.mode_line)
        window.mode_line.container.collapsed = true;
}

function show_minibuffer (window) {
    window.minibuffer.element.collapsed = false;
    if (minibuffer_autohide_with_mode_line && window.mode_line)
        window.mode_line.container.collapsed = false;
}
