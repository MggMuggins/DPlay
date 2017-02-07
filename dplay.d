module main;

import std.stdio : write;
import std.stdio;
import std.file;
import std.conv : to;
//import std.algorithm : remove;

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

    void writeSelf() {
    int i = 0;
        for(i = 0; i < letter.length; ++i) {
            //letter[i] = removeNewlines(letter[i]);
            write(letter[i]);
        }
    }
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
    string basePath = "/home/wesley/workspace/DPlay/fonts/";
    string font = "default/";
    char[] path;
    path ~= basePath ~= font ~= ' ';
    char[] input = to!(char[])(args[1]);
    //path[path.length - 1] = 'T';
    writeln("Setup done in: ");
    writeln(path);

    for(i = 0; i < input.length; ++i) {
        letters[input[i]] = new Letter();
        path[path.length - 1] = input[i];
        lib.open(to!string(path), "r");
        while (!lib.eof) {
            letters[input[i]].addLine(to!(char[])(lib.readln()));
        }
        lib.close();
    }
    writeln("Read into Objects done.");

    //writeln(input);

    //*******************************************
    /*Not needed right now
    letters['a'] = new Letter();
    File aF = File("/home/wesley/workspace/DPlay/fonts/default/a", "r");
    letters['g'] = new Letter();
    File gF = File("/home/wesley/workspace/DPlay/fonts/default/g", "r");

    writeln("Done Creating Objects");

    while (!aF.eof) {
        letters['a'].addLine(to!(char[])(aF.readln()));
    }
    while (!gF.eof) {
        letters['g'].addLine(to!(char[])(gF.readln()));
    }

    writeln("Done Reading to objects.");
    *
    for(i = 0; i < 7; ++i) {
        letters['T'].writeLine(i);
        letters['e'].writeLine(i);
        letters['s'].writeLine(i);
        letters['t'].writeLine(i);
        writeln();
    }
    //aL.writeSelf();*/

    writeln("Beginning write-out");
    writeln("While condition = ", letters[input[0]].letter.length);
    do {
        for(i = 0; i < input.length; ++i) {
            letters[input[i]].writeLine(j);
        }
        writeln();
        ++j;
    } while(j < letters[input[0]].letter.length);
	return 0;
}
