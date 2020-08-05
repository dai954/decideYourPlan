# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  基本形 Place.create(name: '', address: '', link: '', image: '', prefecture: '', description: '')

#  配列形 
#  Place.create!(
#   [
#     {
#       name: '',
#       address: '',
#       link: '',
#       image: '',
#       prefecture: '',
#       description: ''
#     },
#     ]
#   )


Place.create!(
  [
    {
      name: '海遊館',
      address: '大阪府大阪市港区海岸通１丁目１−１０',
      link: 'https://www.kaiyukan.com/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/2b/2b837a31797503e063fe3924f393a7a1_w.jpg',
      prefecture: '大阪府',
      description: '大阪で人気の水族館、「海遊館」へデートに行きませんか？大好きな恋人がいる方、付き合っていないけれど一緒に1日を過ごしたい人がいる方必見！海遊館の回り方だけでなく、おすすめのランチやディナー場所も含めたデートプランをご提案します♡'
    },
    {
      name: 'USJ',
      address: '大阪府大阪市此花区桜島２丁目１−３３',
      link: 'https://www.usj.co.jp/',
      image: 'https://cdn.pixabay.com/photo/2016/12/18/03/12/usj-1914942_1280.jpg',
      prefecture: '大阪府',
      description: 'ドキドキ・ワクワクのアトラクション・ショー。最新鋭の技術やハリウッド仕込みのパフォーマンスで興奮&感動の体験を！'
    },
    {
      name: '難波city',
      address: '大阪府大阪市中央区難波５丁目１−６０',
      link: 'http://www.nambacity.com/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/62/623db8ed5eec7c01c2ad6cc768c0e0fa_w.jpg',
      prefecture: '大阪府',
      description: '南海なんば駅直結の、人気ブランドやトレンドアイテムのショップ、レストランやカフェなど約300店舗が集結しているショッピングモールです。関西初登場のブランドショップやこだわりアイテムもあれば、難波にいながら大阪各地の名物を味わえる食事処も多くある、贅沢なデートスポットです。'
    },
    {
      name: '大阪城公園',
      address: '大阪府大阪市中央区大阪城１−１',
      link: 'https://www.osakacastle.net/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/0b/0ba5b7caaaa6b3b0f21e586176fadf76_w.jpg',
      prefecture: '大阪府',
      description: 'ここ最近、大阪城公園がどんどんオシャレに進化しているのをご存知ですか？ 今や、お城って歴史好きだけのものではなくなっているんです♡ 特別歴史に興味がないカップルも、たまには公園デート感覚で「大阪城デート」を楽しんでみませんか？ ランチからディナーまで、大阪城公園で丸一日デートするモデルプランをご紹介しちゃいます！'
    },
    {
      name: 'エキスポシティ',
      address: '大阪府 吹田市千里万博公園2-1',
      link: 'https://www.expocity-mf.com/expo/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/2c/2cae3e7ef417e78a88a42b3a0d2d7b10_w.jpg',
      prefecture: '大阪府',
      description: 'エキスポシティは、大型のショッピング施設やあらゆるエンターテイメント施設が集まった大型複合施設です。その見どころは一日では周りきれないほどたくさんあります。エキスポシティで何をしようか迷っている方にぜひ見ていただきたいです。'
    },
    {
      name: '京都水族館',
      address: '京都府京都市下京区観喜寺町35−1',
      link: 'https://www.kyoto-aquarium.com/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/de/dea53e3f06f9d34622d105d22df5ee7a_w.jpg',
      prefecture: '京都府',
      description: '展示のほか、イルカパフォーマンスなどの毎日開催しているプログラムも充実。疲れた時にぴったりのマドラー付きドリンクはデートの思い出にもぴったり。'
    },
    {
      name: '京都タワー',
      address: '京都府京都市下京区 烏丸通七条下ル東塩小路町721-1',
      link: 'https://www.keihanhotels-resorts.co.jp/kyoto-tower/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/0e/0e5b80e08fa43f0ffee42cde09e67f48_w.jpg',
      prefecture: '京都府',
      description: '京都タワーは京都駅の中央口の目の前にある京都市のランドマークとなっています。白くほっそりとしたフォルムは海のない京都の街を照らす灯台をイメージしたものです。京都タワーとその下の京都タワービルを合わせた高さは京都市街で一番高く、地上100メートルにある展望室からは京都の市内や数々の国宝、世界遺産を上から見ることができます。'
    },
    {
      name: '嵐山',
      address: '京都府京都市右京区',
      link: 'http://www.pref.kyoto.jp/koen-annai/ara.html',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/02/02429f65fdef924dd9c7fb5507e0690b_w.jpg',
      prefecture: '京都府',
      description: '嵐山は、山や川のある名勝地でさらに桜や紅葉、数多くの由緒ある寺院や神社などがある日本の代表的な観光地ですね。また修学旅行で京都観光と合わせて、訪れた方も多いと思います。'
    },
    {
      name: '城崎マリンワールド',
      address: '兵庫県豊岡市瀬戸1090',
      link: 'http://marineworld.hiyoriyama.co.jp/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/3f/3f084572bde23a1b35a86890fe832b57_w.jpg',
      prefecture: '兵庫県',
      description: '「城崎（きのさき）マリンワールド」は兵庫県豊岡市にある水族館です。外湯めぐりで知られている「城崎温泉」から近く、車で10分ほどの場所に位置しています。その為、日帰りで遊びに来る方も多く子供連れのファミリーやカップルのデートスポットとして人気があります。'
    },
    {
      name: 'メリケンパーク・ハーバーランド',
      address: '兵庫県豊岡市赤石',
      link: 'https://www.feel-kobe.jp/area-guide/meriken-harbor/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/35/358f9b1642f86c6b10f077af61d27b1d_w.jpg',
      prefecture: '兵庫県',
      description: '兵庫県の中でも、神戸定番のデートスポットとして知られるのが、「メリケンパーク」です。ショッピングにも食事にも事欠かない人気スポット！今回はそんな「メリケンパーク」について、神戸在住数十年の筆者がお伝えします。'
    },
    {
      name: '淡路島　淡路ファームパークイングランドの丘',
      address: '兵庫県南あわじ市八木養宜上1401',
      link: 'https://www.england-hill.com/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/76/76dc085b567883a633ccc73c950a2a49_w.jpg',
      prefecture: '兵庫県',
      description: '「淡路ファームパークイングランドの丘」は淡路島を代表する観光地で、その広大な敷地では、農業体験や動物との触れ合い、お花畑の散策、淡路島ならではのグルメなど、さまざまな体験ができるんです！'
    },
    {
      name: '奈良公園',
      address: '奈良県奈良市芝辻町543',
      link: 'http://nara-park.com/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/d1/d11b52653f06401441be07328845bc9c_w.jpg',
      prefecture: '奈良県',
      description: '奈良デートお出かけスポットの定番といえば「奈良公園」ではないでしょうか？お天気のいい日には青々とした芝生の広い公園を二人でお散歩すればリフレッシュした気分になれそう。奈良公園にはかわいい鹿たちもたくさんいて、見ているだけで癒されますね。'
    },
    {
      name: 'ならまち',
      address: '奈良県奈良市中院町',
      link: 'https://narashikanko.or.jp/feature/naramachi/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/83/839ed7f9c789050afd2c512aeb6774ed_w.jpg',
      prefecture: '奈良県',
      description: '奈良公園のすぐ近くにひっそりと存在する、通称「ならまち」と呼ばれるスポット。レトロな雰囲気に観光スポット、そして数多くの名店が軒を連ねる、ここは隠れた名所なのである。'
    },
    {
      name: '法隆寺',
      address: '奈良県生駒郡斑鳩町法隆寺山内1-1',
      link: 'http://www.horyuji.or.jp/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/b3/b3a771efc4cac2b2f2ddd0b51fd7254e_w.jpg',
      prefecture: '奈良県',
      description: '奈良県生駒郡にある法隆寺。世界遺産にも登録されている、奈良県でもメジャーなお寺です。607年に推古天皇と聖徳太子が創建し、670年に一度建物が焼失してしまいしたが、世界最古の木造建築物として有名です。敷地内には190を超える国宝や重要文化財がり、飛鳥時代の神秘的な雰囲気を味わえます。奈良県に観光に来た際はもちろん、近くに住んでいる方にもおすすめの観光スポットです。'
    },
    {
      name: 'アドベンチャーワールド',
      address: '和歌山県西牟婁郡白浜町堅田2399',
      link: 'https://www.aws-s.com/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/a6/a66af3f2ebfba45fa6ac7002fd74d27e_w.jpg',
      prefecture: '和歌山県',
      description: '和歌山県でデートをするなら、外せないのがココ！「アドベンチャーワールド」です。海・陸・空の動物たち、自然とのふれあいをテーマにしたテーマパークで、思い思いの過ごし方を満喫しましょう！'
    },
    {
      name: 'とれとれ市場 南紀白浜',
      address: '和歌山県西牟婁郡白浜町堅田2521',
      link: 'https://toretore.com/ichiba/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/f9/f9f8ad2364c4c6a52c5ffa9a777ada8b_w.jpg',
      prefecture: '和歌山県',
      description: '南紀白浜の堅田漁業組合が、新鮮な魚介類を嬉しい値段で提供。全長2ｍほどもある勝浦漁港直送のまぐろの解体のパフォーマンスがある。「とれとれ市場横丁」では、新鮮魚介を使った料理をオドロキ価格で堪能でき、お刺身がやはりおすすめになっている。'
    },
    {
      name: '円月島',
      address: '和歌山県西牟婁郡白浜町臨海',
      link: 'http://www.nanki-shirahama.com/search/details.php?log=1332736052',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/e5/e5d77625931e6c133bd224d1d8282516_w.jpg',
      prefecture: '和歌山県',
      description: '臨海浦にある小さな島で、島にぽっかりと空いた穴が円い月のように見えることから円月島と呼ばれるようになりました。波の浸食により作られたこの形は自然の力強さを感じられる絶景スポットです。'
    },
    {
      name: '彦根城',
      address: '滋賀県彦根市金亀町1-1',
      link: 'https://www.hikoneshi.com/jp/castle/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/fa/fa9c6ada1e98e0730458052f8c309a9b_w.jpg',
      prefecture: '滋賀県',
      description: '彦根といえば有名な観光名所「彦根城」がありますね。初めて二人きりのデートで訪れる王道のスポットではないでしょうか。お城は歴史があり、いろいろ学べば学ぶほど楽しさが増してきますが、何もわからなくても見た目の荘厳さや周辺の風情溢れる城下町など散策するのも楽しいですよ！'
    },
    {
      name: 'なぎさ公園',
      address: '滋賀県大津市島の関～晴嵐1丁目までの湖岸',
      link: 'https://www.biwako-visitors.jp/spot/detail/2975',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/52/522db025084b5df8df49c5c149438c97_w.jpg',
      prefecture: '滋賀県',
      description: '総延長4.8kmの水辺公園で、散策やびわ湖と親しむには絶好の公園。浜大津から石山までの一帯で6つのゾーンからなり、敷地内には県立芸術劇場「びわ湖ホール」やドイツ料理が楽しめる「ヴュルツブルグハウス」、琵琶湖に面したオープンカフェ「なぎさのテラス」、市民プールなどがあります。6つのゾーンの一つ「おまつり広場」は大津港にあるびわこ花噴水の一番のビューポイントで、さまざまなイベントが行われています。4月～6月頃には蜃気楼が見られることもあります。'
    },
    {
      name: 'びわ湖バレイ',
      address: '滋賀県大津市木戸1547-1',
      link: 'http://www.biwako-valley.com/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/e7/e7f863116ad370760d1cbdfa345c747a_w.jpg',
      prefecture: '滋賀県',
      description: '京阪神からアクセス快適。雪質の良さと変化に富んだ8つのコースが自慢。モーグルバーン、ポールバーン、ハーフパイプやスノーパークの専用コースから、そり遊びゲレンデにキッズ専用スキーレッスン「スキッズ・キャンプ」と、すべてのレベル・年代の方に楽しんでいただけます。'
    }

  ]
)

Subplace.create!(
  [
    {
      name: '天保山大観覧車',
      place_id: 1,
      address: '大阪府大阪市港区海岸通１丁目１−１０',
      link: 'https://www.kaiyukan.com/thv/ferriswheel/',
      image: 'https://d1f5hsy4d47upe.cloudfront.net/89/897ffb770a15d687656df4591b02b17a_w.jpg',
      prefecture: '大阪府',
      description: '地上高、世界最大級の高さ112.5mを誇る「大観覧車」は、1997年7月12日に誕生しました。晴れた日には、東は生駒山系、西は明石海峡大橋、南は関西国際空港、北は六甲山系まで、ぐるっと一望できます。所要時間は約15分。キャビンの中では、日本語と英語で景色の説明が放送されます。'
    }
  ]
)