以下コマンドで必要なソフトウェアをFlatpakからインストール

```bash
flatpak install org.fcitx.Fcitx5
flatpak install org.fcitx.Fcitx5.Addon.Mozc
flatpak install com.mattjakeman.ExtensionManager
```

==ExtensionManager==を起動してBrowseタブ内の検索バーからInput Methodを検索し、以下をインストール

```bash
Input Method Panel
```

Installedタブから以下を**有効化**

```bash
Input Method Panel
```

Gnome Shellのトップバーに新しく現れたアイコン（おそらくenというアイコン）をクリックして  
表示されたメニューからSettingsをクリックするとFcitx Configurationが起動するので  
Available Input Method下の検索バーにMozcと入力し検索結果に表れたMozcをクリックし、  
「<」ボタンをクリックすることでMozcがCurrent Input Methodに追加される。

**以上で設定は完了。**

多言語に対応したソフトウェアの上でCtrl+スペースバーを「あ（Hiragana）」と表示されるまで押下すれば日本語入力ができます。

日本語キーボードを使用している場合は別途、  
Gnome ShellのSettingsのKeyboard項目のInput SourcesにJapaneseを追加してEnglish (US)を削除してください。  
USキーボードを使用している場合は不要な設定です。