# はじめに

Dartを使っているので、[Dart SDK](https://www.dartlang.org/tools/sdk/)をダウンロードして下さい。

dart-sdkをダウンロード、解凍するとdartというディレクトリが出来ています。
dartディレクトリの中にdart-sdkというディレクトリがあるので、そこを環境変数DART_SDKに設定しておきます。

````
$ echo 'export DART_SDK=/path/to/dart/dart-sdk' >> ~/.bash_profile

# zshユーザー
$ echo 'export DART_SDK=/path/to/dart/dart-sdk' >> ~/.zshenv
````

dart-sdk内のbinディレクトリにPATHを通します。

````
$ echo 'export PATH=$PATH:$DART_SDK/bin' >> ~/.bashrc

# zshユーザー
$ echo 'export PATH=$PATH:$DART_SDK/bin' >> ~/.zshrc
````

あとは git clone したレポジトリのトップディレクトリで以下のコマンドを実行して下さい。

````
$ pub get
$ pub serve
````
