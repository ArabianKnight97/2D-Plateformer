function draw_centered_text(x, y, text) {
	draw_text(x - string_width(text)/2, y - string_height(text)/2, text)
}
// format_number_with_commas(value)
function format_number_with_commas(value) {
    var num_str = string(abs(value)); // Convert to string and ensure positive for formatting
    var len = string_length(num_str);
    
    if (len <= 3) return num_str; // No need for commas if under 1000

    var formatted_str = "";
    var count = 0;

    for (var i = len; i > 0; i--) {
        formatted_str = string_char_at(num_str, i) + formatted_str;
        count++;
        if (count % 3 == 0 && i > 1) {
            formatted_str = "," + formatted_str; // Insert comma every 3 digits
        }
    }

    return formatted_str;
}
