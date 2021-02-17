# johoTA

1. C/C++のソースコードを以下のようなディレクトリ構成で作成する。ワークスペース名、ファイル名は任意。
```
workspace/
　┗━ src/
      ┣━ hoge1.cpp
      ┗━ hoge2.cpp
```
※ヘッダファイルがある場合は以下のような構成にする。
```
workspace/
  ┣━ src/
  ┃   ┣━ hoge1.cpp
  ┃   ┗━ hoge2.cpp
  ┗━ include/
      ┗━ hogehoge.h
```
2. src内でコンパイル用のスクリプトを呼ぶ（エイリアスを設定しておくと楽）。
```
workspace/src$ sh path_to_scripts/compile_cpp.sh hoge1.cpp
```
3. コンパイルが成功すると以下のような構成になる。
```
workspace/
 ┣━ src/
 ┃   ┣━ hoge1.cpp
 ┃   ┗━ hoge2.cpp
 ┗━ bin/
     ┗━ hoge1.out

```
4. プログラムを実行するときはsrc内で実行用のスクリプトを呼ぶ（エイリアスを設定しておくと楽）。  
   コマンドライン引数がある場合はこの時にスクリプトの引数として入力する。
```
workspace/src$ sh path_to_scripts/run_c.sh hoge1.cpp
```
5. テストケースを作るときはsrc内でテストケース作成用のスクリプトを呼ぶ（エイリアスを設定しておくと楽）。  
   コマンドライン引数 or 標準入力を渡す場合はこの時にスクリプトの引数として入力する。  
   以下は「1 2 3 4 5」を標準入力として渡す例。
```
workspace/src$ sh path_to_scripts/make_testcase.sh hoge1.cpp 1 2 3 4 5
```
6. プログラムが実行されると以下のようなフォルダ構成になる。  
   「.in」ファイルには標準入力、「.out」ファイルには標準出力が記載されている。  
   ファイル名の番号は1から順番に若い番号が付けられる。
```
workspace/
 ┣━ src/
 ┃   ┣━ hoge1.cpp
 ┃   ┗━ hoge2.cpp
 ┣━ bin/
 ┃   ┗━ hoge1.out
 ┗━ test_case/
     ┗━ hoge1/
         ┣━ 1.in
         ┗━ 1.out
```
7. hoge1.cpp、hoge2.cppでそれぞれn個テストケースを作成した場合は最終的に以下のようなフォルダ構成になる。
```
workspace/
 ┣━ src/
 ┃   ┣━ hoge1.cpp
 ┃   ┗━ hoge2.cpp
 ┣━ bin/
 ┃   ┣━ hoge1.out
 ┃   ┗━ hoge2.out
 ┗━ test_case/
     ┣━ hoge1/
     ┃   ┣━ 1.in
     ┃   ┣━ 1.out
     ┃   .
     ┃   .
     ┃   ┣━ n.in
     ┃   ┗━ n.out
     ┗━ hoge2/
         ┣━ 1.in
         ┣━ 1.out
         .
         .
         ┣━ n.in
         ┗━ n.out
```
