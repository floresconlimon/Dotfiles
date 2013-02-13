// the default page for new buffers.
homepage = "file:///home/velius/code/html/main.html";

require("clicks-in-new-buffer.js");
// Set to 0 = left mouse, 1 = middle mouse, 2 = right mouse
clicks_in_new_buffer_button = 2; //  Now right mouse follows links in new buffers.
// Set to either OPEN_NEW_BUFFER or OPEN_NEW_BUFFER_BACKGROUND
clicks_in_new_buffer_target = OPEN_NEW_BUFFER_BACKGROUND; // Now buffers open in background.


// load urls from the command line in new buffers instead
// of new windows.
//url_remoting_fn = load_url_in_new_buffer;

require("global-overlay-keymap.js");
define_key_alias("C-m", "return");
// doesn't work :(
//define_key_alias("C-g", "Escape");

// load download buffers in the background in the current
// window, instead of in new windows.
download_buffer_automatic_open_target = OPEN_NEW_BUFFER_BACKGROUND;


// save a keystroke when selecting a dom node by number.
hints_auto_exit_delay = 700;
hints_ambiguous_auto_exit_delay = 700;


// default directory for downloads and shell commands.
cwd = get_home_directory();
cwd.append("Downloads");


// automatically handle some mime types internally.
//content_handlers.set("application/pdf", content_handler_save);
content_handlers.set("application/zip", content_handler_save);
content_handlers.set("application/rar", content_handler_save);
content_handlers.set("application/x-rar-compressed", content_handler_save);
content_handlers.set("application/octet-stream", content_handler_save);


// external programs for handling various mime types.
external_content_handlers.set("application/pdf", "okular");
external_content_handlers.set("application/x-bittorrent", "deluge");
//external_content_handlers.set("video/*", "urxvtc -e mplayer");

// use vi as external editor.
editor_shell_command = "emacsclient -c";


// view source in your editor.
view_source_use_external_editor = true;


// let xkcd-mode put the funny alt text into the page.
xkcd_add_title = true;

//webjumps
define_webjump("youtube", "http://www.youtube.com/results?search_query=%s&search=Search");

define_webjump("mangatraders", "http://www.mangatraders.com/google/?cx=partner-pub-9385663428241404%3Aigghpakh4ks&cof=FORID%3A10&ie=UTF-8&q=%s&sa=Search&siteurl=www.mangatraders.com%2F&ref=&ss=1129j463839j9");

define_webjump("projectfreetv", "http://www.free-tv-video-online.me/search/?q=%s&md=all");

webjumps.y = webjumps.youtube;
webjumps.g = webjumps.google;
webjumps.mm = webjumps.mangatraders;
webjumps.tv = webjumps.projectfreetv;

define_webjump("isohunt", "http://isohunt.com/torrents/?ihq=%s");

webjumps.i = webjumps.isohunt;

define_webjump("mangapark", "http://www.mangapark.com/search?name=%s");

webjumps.m = webjumps.mangapark;

//keys
define_key(content_buffer_normal_keymap, "9", "home");
