module main;

import std.stdio;
import std.file;
import std.conv : to;
import std.getopt;

class Letter {
    char[][] letter;

    this() {
    }

    void addLine (char[] line) {
        this.letter ~= line;
    }

    void writeLine(int depth) {
        letter[depth] = removeNewlines(letter[depth]);
        write(letter[depth][]);
    }
}

struct PathInfo {
    string basePath = "/usr/local/DPlay/fonts/";
    string font = "default";
    string altPath;
}

char[] removeNewlines(char[] stuff) {
    ulong i = stuff.length - 1;
    if (i == -1) {
        return stuff;
    }
    stuff[i] = ' ';
    return stuff;
}

PathInfo argHandle(string[] args) {
    PathInfo parts;
    getopt(args,
        "file|f", &parts.font,
        "path|p", &parts.altPath);
    return parts;
}

char[] pathHandle(string[] args) {
    PathInfo parts;
    parts = argHandle(args);
    char[] path;
    if (parts.altPath == null) {
        path ~= parts.basePath ~ parts.font ~ "/ ";
    } else if (parts.altPath[$ - 1] == '/') {
            path ~= parts.altPath ~ parts.font ~ "/ ";
    } else {
            path ~= parts.altPath ~ '/' ~ parts.font ~ "/ ";
    }
    return path;
}

int main(string[] args) {
    int j = 0, i = 0;
    File lib;
    Letter[char] letters;
    char[] path, input;

    path = pathHandle(args);

    input = to!(char[])(args[$ - 1]);

    //Reading into input from files
    for(i = 0; i < input.length; ++i) {
        if (letters[input[i]] is null) {
            letters[input[i]] = new Letter();
        }
        path[$ - 1] = input[i];
        try {
            lib.open(to!string(path), "r");
        } catch (std.exception.ErrnoException) {
            writeln("Invalid font argument!");
            return 42;
        }
        do {
            letters[input[i]].addLine(to!(char[])(lib.readln()));
        } while (!lib.eof);
        lib.close();
    }

    //And the writing statement. I should modularize this...
    do {
        for(i = 0; i < input.length; ++i) {
            letters[input[i]].writeLine(j);
        }
        writeln();
        ++j;
    } while (j < letters[input[0]].letter.length);
	return 0;
}
