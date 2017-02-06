module main;

import std.stdio : write;
import std.stdio;
import std.file;
import std.conv : to;
import std.algorithm : remove;

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
    int i = 0;
    auto aL = new Letter();
    File aF = File("/home/wesley/workspace/DPlay/fonts/default/a", "r");
    auto GL = new Letter();
    File GF = File("/home/wesley/workspace/DPlay/fonts/default/G", "r");

    writeln("Done Creating Objects");

    while (!aF.eof) {
        aL.addLine(to!(char[])(aF.readln()));
    }
    while (!GF.eof) {
        GL.addLine(to!(char[])(GF.readln()));
    }

    writeln("Done Reading to objects.");

    for(i = 0; i < aL.letter.length; ++i) {
        aL.writeLine(i);
        GL.writeLine(i);
        writeln();
    }
    //aL.writeSelf();
	return 0;
}
