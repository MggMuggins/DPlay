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
        //Not the cleanest or best solution to this problem
        try {
            letter[depth] = removeNewlines(letter[depth]);
            write(letter[depth][]);
        } catch (core.exception.RangeError) {}
    }
}

struct PathInfo {
    string basePath = "/usr/local/DPlay/fonts/", font, altPath;
}

char[] removeNewlines(char[] stuff) {
    ulong i = stuff.length - 1;
    if (i == -1) {
        return stuff;
    }
    stuff[i] = ' ';
    return stuff;
}

//Handles path related arguments
PathInfo argHandle(string[] args) {
    PathInfo pathParts;
    getopt(args,
        "file|f", &pathParts.font,
        "path|p", &pathParts.altPath);
    return pathParts;
}

char[] pathHandle(string[] args) {
    PathInfo pathParts;
    pathParts = argHandle(args);
    char[] path;
    if (pathParts.altPath == null) {
        path ~= pathParts.basePath ~ pathParts.font ~ "/ ";
    } else if (pathParts.altPath[pathParts.altPath.length - 1] == '/') {
            path ~= pathParts.altPath ~ pathParts.font ~ "/ ";
    } else {
            path ~= pathParts.altPath ~ '/' ~ pathParts.font ~ "/ ";
    }
    return path;
}

int main(string[] args) {
    int j = 0, i = 0;
    File lib;
    Letter[char] letters;
    char[] path, input;

    path = pathHandle(args);

    input = to!(char[])(args[args.length - 1]);

    //Reading into input from files
    for(i = 0; i < input.length; ++i) {
        letters[input[i]] = new Letter();
        path[path.length - 1] = input[i];
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
