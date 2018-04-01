use Mix.Config
use Xee.ThemeConfig

config :xee, Xee.ThemeServer, tags: [
   {"経済実験", [
     {"入門経済学", []},
     {"行動経済学", []},
     {"ゲーム理論", []},
     {"オークション理論", []}
   ]},
   {"授業支援", []},
   {"その他", []}
]

theme DoubleAuction,
  name: "ダブルオークション",
  external: true,
  host: "https://dgck9eazhc8m1.cloudfront.net/double_auction/host.js",
  participant: "https://dgck9eazhc8m1.cloudfront.net/double_auction/participant.js",
  tags: ["入門経済学", "オークション理論"]

register_themes()
