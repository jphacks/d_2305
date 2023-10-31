# PredicTalk
<img width="100%" alt="PredicTalk" src="https://github.com/jphacks/NG_2305/assets/78719395/c3160c3a-5101-4182-8e85-7ab3148c5d12">

## デモ動画
[こちら](https://youtu.be/Jx81Q2Q_JAw)からデモ動画をご覧いただけます．

## 開発メンバーと主な役割
- [青原光](https://github.com/hikaruaohara)：システムの全体設計・システム開発（予測機能部，UI・UX）
- [伊藤朝陽](https://github.com/asahi-abc)：システム開発（音声認識部）
- [目瀬道瑛](https://github.com/ZnnZ0)：システム開発（予測機能部と音声認識部に使用する技術調査）・広報

## 目次
- [製品概要](#製品概要)
  - [開発背景](#開発背景)
  - [対象ユーザ](#対象ユーザ)
  - [特徴](#特徴)
    - [特徴1：発話を補助しすぎません！](#特徴1：発話を補助しすぎません！)
    - [特徴2：発話を視覚的に補助します！](#特徴2：発話を視覚的に補助します！)
    - [特長3：速度と精度を両立しています！](#特長3：速度と精度を両立しています！)
- [製品説明](#製品説明)
  - [iOSアプリ単体で使用する方法](#iOSアプリ単体で使用する方法)
  - [iOSアプリをARデバイスと組み合わせて使用する方法](#iOSアプリをARデバイスと組み合わせて使用する方法)
- [解決できること](#解決できること)
- [今後の展望](#今後の展望)
  - [展望1：対話内容に基づく予測単語の精度向上](#展望1：対話内容に基づく予測単語の精度向上)
  - [展望2：UIやその他の機能の拡充](#展望2：UIやその他の機能の拡充)
- [注力したこと](#注力したこと)
  - [ポイント1：予測機能の実装](#ポイント1：予測機能の実装)
  - [ポイント2：新たな情報源の導入](#ポイント2：新たな情報源の導入)
  - [ポイント3：視覚的に邪魔になる情報の削除](#ポイント3：視覚的に邪魔になる情報の削除)
- [開発技術](#開発技術)
  - [活用した技術](#活用した技術)
    - [API・データ](#API・データ)
    - [フレームワーク・ライブラリ・モジュール](#フレームワーク・ライブラリ・モジュール)
    - [デバイス](#デバイス)
  - [独自技術](#独自技術)
    - [ハッカソンで開発した独自機能・技術](#ハッカソンで開発した独自機能・技術)
      - [音声認識結果の保存機能](#音声認識結果の保存機能)
  - [製品に取り入れた研究内容](#製品に取り入れた研究内容)

## 製品概要
<span style="font size:200%;">「会話 × Tech」：初心者以上・ネイティブ未満の英語学習者を対象とした英会話を視覚的に補助するためのアプリ</span>
<img width="100%" alt="製品概要のイラスト" src="https://github.com/jphacks/NG_2305/assets/103105513/74a8bc0a-0edb-4606-ac84-3fe09efbc76f">

### 開発背景
日本人が外国人と英語で会話をする場合，英語をほとんど話せない初心者は翻訳アプリを利用します．  
言いたい日本語を入力すれば適切な英語が出力される上，発音が分からなくても機械音声に頼れるからです．  
ところが，英語がある程度話せるユーザの目線に立ってみると，翻訳アプリは英会話を補助するアプリとして十分な機能を果たしてるとは言えません．  
それは，彼らが持つ
- 基本的な単語や文法は知っているので**できるだけ自力で会話したい**
- けれど，実際に会話すると**単語や文法がスムーズに出てこない**
- でも，翻訳アプリをちらちら見ながら会話するのではなく**相手の表情や仕草を見てコミュニケーションしたい**
- それに，**勉強したのに結局翻訳アプリ頼りなのは歯がゆい**
というジレンマを解消できていないからです．

私たちはこのジレンマに着目し
- 基本的な単語や文法を知っており，できるだけ自力で相手を見ながら会話したいが，スムーズに話すスキルがないユーザ向けに
- **「相手を見ながら」** にして **「スムーズな英会話をするための補助が受けられる」**

そんな製品開発を目指しました．

### 対象ユーザ
- 日本人
- 基本的な単語や文法の知識を持つ初心者以上・ネイティブ未満の英語学習者
- 実際の英会話において「できるだけ自分の力で話したい」が「スムーズに単語や文法が出てこない」けど「翻訳アプリに頼りきりは嫌だ
」というニーズを持つ

### 特長
#### 特徴1:発話を補助しすぎません！
**「勉強内容を活用して自分の力で会話したい」** というニーズに応えるために，発話を補助しすぎないようにしています．  
具体的には，現在の発話から予想される続きの単語や文章の一部を表示することで，**「あくまでユーザに思い出させる」** ことを意識しています．  
**「"これまで勉強してきた単語や文法を活用して相手と同じ言語でやり取りできる喜び"を損なわない」** という点が，既存の翻訳アプリとの差別化になっています．

#### 特徴2：発話を視覚的に補助します！
相手の表情や仕草を見ることはコミュニケーションにおいて大切です．  
そのため，**発話を視覚的に補助するデバイスとしてARグラスを使用**することにしました．  
具体的には，現在の発話から予想される続きの単語や文章がARグラス上に透過表示されます．  
これにより，ユーザは相手を見ながらにして会話のサポートを受けられるようになります．

#### 特長3：速度と精度を両立しています！
本製品はユーザの発話を認識してそこから予想される単語や文章を生成します．  
したがって，ユーザのスムーズな会話を支援するために **「音声認識と予測機能の速度と精度を両立」** することが求められます．  
そこで，私たちはMoblieBertやGPT2などの複数の予測技術を実装して速度と精度のバランスを検証しました．  
その結果，**音声認識の部分はAppleが提供するSpeach frameworkを，予測機能の部分は生成AIで有名なOpenAIが提供するGPT-3.5-Turbo APIを利用することで速度と精度のバランスを実現**しました．  

## 製品説明
### iOSアプリ単体で使用する方法
1. アプリを起動して画面をタップすると音声認識が開始されます

<img width="50%" alt="アプリ起動時のスマホ画面" src="https://github.com/jphacks/NG_2305/assets/78719395/8db669c8-8221-42f5-b3f7-cdd60c2bebc4">

2. ユーザが発話すると音声認識され，発話内容が白色の文字で表示されます
3. ユーザの発話を基に続きの単語や文章が予測され，予測結果が薄い白色の文字で表示されます
  
<img width="50%" alt="音声認識時のスマホ画面" src="https://github.com/jphacks/NG_2305/assets/78719395/18f8ca2f-8d62-4b54-a269-0b932a0f29d6">

### iOSアプリをARデバイスと組み合わせて使用する方法
1. ARグラスとiPhoneを接続します（外部ディスプレイとして利用できるARグラスであればどの会社のARグラスでも利用可能です）
2. [iOSアプリ単体で使用する方法](#iOSアプリ単体で使用する方法)で説明した通り，アプリを起動して音声認識を開始します
4. ユーザが発話するとARグラス上に予測結果が透過表示されることで，ユーザは相手の表情や仕草を見ながら発話の支援を受けることができます

<table>
  <tr>
    <td>
      <img width="100%" alt="ARグラス装着時のイメージ図" src="https://github.com/jphacks/NG_2305/assets/109562639/c99497f8-dbb3-4ae8-a9b1-bd5876359a21">
    </td>
    <td>
      <img width="100%" alt="iPhone内で起動中の本製品とXREAL社のXREAL airを接続して着用している様子" src="https://github.com/jphacks/NG_2305/assets/109562639/35ddd113-a542-46d0-9a0f-c078bbbcd8f7">
    </td>
  </tr>
</table>

## 解決出来ること
まず，初心者以上・ネイティブ未満の外国語学習者が持っている「学んだ外国語を利用してコミュニケーションしたい」というニーズを尊重し，**「実際の会話で単語や文法がスムーズに出てこない」でも「せっかく勉強したのに翻訳アプリにすべて頼って会話するのはもったいない」というジレンマが解決**できます．  
また，ただ単語予測をスマホ画面に表示して補助するのではなく市販のARグラスに投影する形で表示することで，翻訳アプリを使用した会話で発生していた **「スマホを頻繫にみながらコミュニケーションする」という不便も解決** しています．  
さらに，使用までの手軽さもポイントです．  
本アプリは **「グラスをかけて画面をタップするだけ」** でサービスが開始されるため，翻訳アプリでありがちな日本語入力の手間などが一切ありません．  

## 今後の展望
### 展望1：対話内容に基づく予測単語の精度向上
スマホやPCの予測変換機能はユーザの入力履歴に基づいて予測の精度が向上します．  
本製品もこの技術の考え方を利用して，**現在の対話内容や過去の対話履歴に基づいた予測**をすることで精度の向上を期待しています．
  
### 展望2：UIやその他の機能の拡充
2日間の開発期間ではUI開発に時間を割けなかったため，現在のUIは必要最低限のクオリティに留まっています．  
今後は**見やすさと面白さを両立したデザインを実装**することで，ユーザにとって不快感の少ないアプリにすることを目指します．  
また，今回はARグラスの使用を想定した最低限の機能しか実装することができませんでした．  
例えば**多言語対応**といった機能を実装していきたいと考えています．

## 注力したこと
### ポイント1：予測機能の実装
開発当初は，MobileBertやGPT2といった言語モデルをiPhone上で動かすことを検討しました.  
しかし，MobileBertは速度は良いが精度に問題があり，GPT2は精度は良いが速度が遅いという問題にぶつかりました．  
**様々な既存技術を試した結果，OpenAIのgpt-3.5-turbo APIが精度と速度の双方を担保した技術であることが分かり，安定した予測機能を実装をすることができました．**

### ポイント2：新たな情報源の導入
市販のARデバイスで使用できるアプリにしたことで，本製品の目的である**コミュニケーションのスムーズさを妨害しないで発話の補助を達成**しました．

### ポイント3：視覚的に邪魔になる情報の削除
音声認識をスタートするためのタップの判定エリアを画面全体にすることで，**話しながらの操作が可能**です．  
画面には自分が話した内容とその文章の続きしか表示されないため余計な情報が存在せず，**会話中にも使用しやすいUX**となっています．

## 開発技術
<img width="100%" alt="開発技術の概要図" src="https://github.com/jphacks/NG_2305/assets/103105513/70c02aa3-dbcf-446d-8d1e-8a81180a0067">

### 活用した技術
#### API・データ
- OpenAI API(gpt-3.5-turbo)
  - OpenAIが提供する自然言語処理のためのAPI
  - ユーザの発話に基づき，発話の続きを生成させるために使用
  - 自身の環境で本アプリを動作させる場合，OpenAIAPIKey.swiftに自身のOpenAI API Keyを入力してください．
```Swift:OpenAIAPIKey.swift
//  OpenAIAPIKey.swift

let API_KEY = "<Input Your API Key Here>"
```

#### フレームワーク・ライブラリ・モジュール
- Speech
  - Appleが提供する音声処理のための純正フレームワーク
  - ユーザの発話内容を認識して文章を出力させるために使用
- CoreML・CoreMLTools
  - CoreML：Applが提供する機械学習モデルをSwift上で使用するための純正フレームワーク
  - CoreMLTools：PytorchやTensorflowで作られたニューラルネットワークモデルをCoreML形式へ変換するためのPythonライブラリ
  - MobileBertとGPT2をCoreML形式へ変換し，iOS端末上で動作させるようにするために使用
- Moya
  - OpenAIのAPIをSwiftで実行するために使用

#### デバイス
- XREAL air
    - アプリの出力をユーザの視界内に表示するために使用

### 独自技術
#### ハッカソンで開発した独自機能・技術
##### 音声認識結果の保存機能
commit_id: [5674e3c7c945d6a1c6ec8a8ade41fcb9ef19ea1d](https://github.com/jphacks/NG_2305/commit/5674e3c7c945d6a1c6ec8a8ade41fcb9ef19ea1d)

音声認識自体はSpeechフレームワークを用いて実装し，音声認識結果を保存する追加機能を独自に実装しました．  
SFSpeechRecognizerを用いて音声をテキストに起こす際に，以下の3つの問題が存在していました．
- Speech frameworkの仕様により音声認識の途中結果がいくつも出力される
- 時間経過により認識された文章が削除されると認識結果が重複して画面に表示される
- 発話が少しでも止まるとそれ以前の認識結果が失われる

これらの問題を解決するために，以下の機能を実装しました．
- 音声認識の途中結果をバッファリング
- 認識完了を検知したら最終結果を画面に出力
- 時間経過で認識された文章が削除されないように認識結果を保存

### 製品に取り入れた研究内容
なし






