module main;

import std.stdio : write;
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

    //Mantenence Method, probably will not include in release execs
    //*
    void writeSelf() {
    int i = 0;
        for(i = 0; i < letter.length; ++i) {
            write(letter[i]);
        }
    }
    //*/
}

char[] removeNewlines(char[] stuff) {
    ulong i = stuff.length - 1;
    stuff[i] = ' ';
    return stuff;
}

int main(string[] args) {
    int j = 0, i = 0;
    File lib;
    Letter[char] letters;
    string basePath = "/usr/local/DPlay/fonts/";
    string font;
    char[] path, input;

    getopt(args, "file|f", &font);

    path ~= basePath ~= font ~= "/ ";
    input = to!(char[])(args[1]);
    //writeln("Setup done in: ");
    //writeln(path);

    for(i = 0; i < input.length; ++i) {
        letters[input[i]] = new Letter();
        path[path.length - 1] = input[i];
        try {
            lib.open(to!string(path), "r");
        } catch (std.exception.ErrnoException) {
            writeln("Invalid font argument!");
            return 42;
        }
        while (!lib.eof) {
            letters[input[i]].addLine(to!(char[])(lib.readln()));
        }
        lib.close();
    }
    //writeln("Read into Objects done.");
    //writeln("Beginning write-out");
    //writeln("While condition = ", letters[input[0]].letter.length);
    do {
        for(i = 0; i < input.length; ++i) {
            letters[input[i]].writeLine(j);
        }
        writeln();
        ++j;
    } while(j < letters[input[0]].letter.length);
	return 0;
}