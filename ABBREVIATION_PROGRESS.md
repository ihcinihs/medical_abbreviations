# 医療略語データ進捗

最終更新: 2026-08-07（JST）

## データの正本

- 総登録件数: 615件
- データ形式: abbreviation, english, japanese, subjects, description, related
- 読み込み対象: assets/data/catalog.json に登録された分野別JSON

## 科目進捗

| 科目 | 状態 | 完了・進行中の範囲 | 今回までの追加件数 |
| --- | --- | --- | ---: |
| 細胞生物学 | 完了 | 細胞小器官、遺伝情報、細胞周期、細胞死、膜輸送、シグナル、細胞接着、幹細胞、品質管理 | 394 |
| 生化学 | 完了 | 解糖系、PPP、TCA回路、糖新生、脂質・リポタンパク、ヌクレオチド、アミノ酸・尿素回路、補酵素代謝 | 100 |
| 生理学 | 進行中 | 膜電位、シナプス、筋収縮、呼吸、腎、循環、自律神経、消化管・内分泌の基礎 | 100 |
| 生理学 | 未着手 | - | 0 |
| 解剖学 | 未着手 | - | 0 |
| 組織学 | 未着手 | - | 0 |
| 発生学 | 未着手 | - | 0 |
| 免疫学 | 未着手 | - | 0 |
| 微生物学 | 未着手 | - | 0 |
| 病理学 | 未着手 | - | 0 |
| 薬理学 | 未着手 | - | 0 |
| 血液学以降の臨床各科 | 未着手 | - | 0 |

## 次回開始地点

生理学: 血液・体液、体温調節、感覚、生殖、睡眠の主要略語から開始する。以後は1バッチ（1パッチ）50語を追加し、各バッチ完了後にJSON構文、重複、必須項目、説明文字数、flutter analyzeを検証する。

## 保留事項

- 既存データに大文字小文字だけが異なる略語があるため、検索上の衝突を避け、追加時は大文字小文字を区別しない重複確認も行う。
- 同一略語が臨床と基礎医学で別の意味をもつ場合、既存構造で区別できなければ追加せず保留する。

## 直近の検証

- JSON構文: 既存6ファイルおよび生化学第1〜第4・生理学第1〜第2バッチでエラーなし
- 略語完全一致重複: 0件（大文字小文字を区別しない全615件の確認、直近確認時）
- flutter analyze: 実行を試行したが、この環境ではflutterコマンドおよび.fvm SDKが見つからず未実行

## バッチ記録

### 生化学 第1バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 解糖系、PPP、TCA回路、酸化還元補酵素
- 追加略語: F6P、F1,6BP、F2,6BP、DHAP、G3P、1,3-BPG、3-PG、2-PG、PEP、PK、PDH、PC、TCA、CS、IDH、α-KG、α-KGDH、SDH、MDH、NAD+、FAD、CoA、Acetyl-CoA、G6PD、R5P
- JSON構文: 正常
- 略語完全一致重複: 0件
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 生化学 第2バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 糖新生、グリコーゲン代謝、脂質・リポタンパク代謝、プリンサルベージ経路
- 追加略語: G1P、UDP-Glc、PGM、G6Pase、FBPase、PEPCK、ACC、FASN、CPT-I、MCAD、HMG-CoA、HMGCR、HMGCS、AcAc、β-HB、LPL、HSL、VLDL、ApoB、ApoC-II、LCAT、CETP、PRPP、HGPRT、APRT
- JSON構文: 正常
- 略語完全一致重複: 0件（大文字小文字を区別しない確認）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- 修正: 既存のFasとの大文字小文字衝突を検出したため、Fatty Acid SynthaseはFASNへ修正
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 生化学 第3バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 尿素回路、アミノ酸代謝、葉酸・一炭素代謝、神経伝達物質代謝
- 追加略語: CPS1、OTC、ASS1、ASL、ARG1、NAGS、GLS、GDH、BCAT、BCKDH、PLP、THF、SAM、BH4、NADP+、NADPH、MTHFR、CBS、PAH、AADC、MAO、COMT、GABA、BCAA、Hcy
- JSON構文: 正常
- 略語完全一致重複: 0件（大文字小文字を区別しない確認）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 生化学 第4バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: ヌクレオチドde novo合成、葉酸・ビタミン補酵素、先天代謝異常
- 追加略語: ADP、AMP、IMP、XMP、GMP、GMPS、UMP、OMP、UMPS、CMP、dUMP、dTMP、RNR、TS、DHFR、DPD、FMN、TPP、B12、CoQ10、GTP、5-FU、PKU、MSUD、HCU
- JSON構文: 正常
- 略語完全一致重複: 0件（大文字小文字を区別しない確認）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

## 200語追加の継続記録

- 依頼分の進捗: 125 / 200件
- 次回: 生理学 第3バッチ（50件）から開始

### 生理学 第1バッチ（2026-08-07）

- 追加件数: 50件
- 完了範囲: 膜電位、シナプス、神経筋接合部、興奮収縮連関、呼吸生理、腎生理、循環・内分泌生理
- JSON構文: 正常
- 略語完全一致重複: 0件（大文字小文字を区別しない確認）
- 必須フィールド・説明100文字以内: 全50件で確認済み
- 修正: 既存略語との検索衝突を避け、IPSCをGlyR、TmをFEKへ置換
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 生理学 第2バッチ（2026-08-07）

- 追加件数: 50件
- 完了範囲: 自律神経、心臓興奮伝導・血行動態、腎尿細管、消化管神経・ホルモン
- JSON構文: 正常
- 略語完全一致重複: 0件（大文字小文字を区別しない確認）
- 必須フィールド・説明100文字以内: 全50件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

## 運用条件

- 2026-08-07以降、追加単位は1バッチ（1パッチ）50語とする。

## 解剖学追加記録

- 完了済み科目・分野: 細胞生物学、生化学、生理学、解剖学
- 分野別追加件数: 神経解剖 25件、血管解剖 25件、運動器解剖 25件、器官別解剖 25件、骨格指標・脊椎・神経根 25件、末梢神経・手の筋腱 25件（計150件）
- 最後に完了した範囲: 解剖学 第6バッチ（四肢・体幹の末梢神経と手の筋腱）
- 次に開始する範囲: 病理学 第1バッチ（炎症・組織損傷）

### 解剖学 第1バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 脳神経、主要伝導路、小脳脚、後方循環
- 追加略語: CN I、CN II、CN III、CN IV、CN V、CN VI、CN VII、CN VIII、CN IX、CN X、CN XI、CN XII、CST、DCML、STT、ALS、UMN、LMN、MCP、SCP、ML、ACA、PCA、AICA、PICA
- JSON構文: 正常（assets/data 配下の全7ファイル）
- 略語完全一致重複: 0件（全965件）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- 修正: 既存のICPとの完全一致を検出したため、下小脳脚ICPは追加せず内側毛帯MLへ置換
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 解剖学 第2バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 頭頸部・体幹・腹部の主要血管
- 追加略語: SCA、BA、ICA、ECA、CCA、PCom、ACom、SVC、IVC、IJV、EJV、BCT、LCCA、LSA、LIMA、GSV、SSV、SMA、IMA、SMV、IMV、PV、HV、CHA、PHA
- JSON構文: 正常（assets/data 配下の全7ファイル）
- 略語完全一致重複: 0件（全990件）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 解剖学 第3バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 骨格筋・関節・靱帯
- 追加略語: TMJ、ACJ、SCJ、GHJ、SIJ、MCPJ、PIPJ、DIPJ、CMCJ、PCL、MCL、LCL、ATFL、PTFL、CFL、UCL、RCL、ITB、TFL、QL、ES、TA、VL、VM、RF
- JSON構文: 正常（assets/data 配下の全7ファイル）
- 略語完全一致重複: 0件（全1015件）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 解剖学 第4バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 眼・呼吸器・消化器・心臓の主要構造
- 追加略語: EOM、IR、LR、SO、IO、ON、CBD、CHD、MPD、APD、GB、GEJ、LUL、LLL、RUL、RML、RLL、LAD、LCx、RCA、PDA、LAA、RAA、LV、LA
- JSON構文: 正常（assets/data 配下の全7ファイル）
- 略語完全一致重複: 0件（全1040件）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 解剖学 第5バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 骨格指標・脊椎・神経根
- 追加略語: ASIS、AIIS、PSIS、PIIS、GT、C1、C2、C3、C4、C5、C6、C7、C8、T1、L1、L2、L3、L4、L5、S2、S3、S4、GON、IAN、LFCN
- JSON構文: 正常（assets/data 配下の全7ファイル）
- 略語完全一致重複: 0件（全1065件）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）

### 解剖学 第6バッチ（2026-08-07）

- 追加件数: 25件
- 完了範囲: 四肢・体幹の末梢神経と手の筋腱
- 追加略語: AxN、MCN、MN、UN、RN、LTN、DSN、SSN、SN、TN、CFN、SPN、DPN、ObN、PhN、ILN、GFN、PudN、FCR、FCU、FDS、APL、EPB、EPL、APB
- JSON構文: 正常（assets/data 配下の全7ファイル）
- 略語完全一致重複: 0件（全1090件）
- 必須フィールド・説明100文字以内: 全25件で確認済み
- flutter analyze: 未実行（flutterコマンドおよび.fvm SDKが環境に存在しない）
