def wrap(text, max_width):
    """Return the words of `text`, wrapped to a max line length of `line_width`."""
    
    column = 0
    lines = [[]]
    for word in text.split():
        # int(column > 0) is 0 if this is the first word on the line;
        # else 1 (to account for the interpolated space)
        if column + int(column > 0) + len(word) > max_width:
            column = 0
            lines.append([])
        lines[-1].append(word)  # lines[-1] is the last item in the lines[] array
        column += int(column > 0) + len(word)
    return '\n'.join(' '.join(line) for line in lines)

print(wrap("aaa bb cc ddddd", 6))
print()
print(wrap("a b c d e f g h i j k l m n o p qqqqqqqqq", 9))
print(wrap("qqqqqqqqqqqqq aaa", 9))