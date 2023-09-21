const express = require("express");
//インスタンスの作成
const app = express();
//JSONの作成
let messageJson = { message: "Hello Flutter!" };
//JSONを送信(ファイル実行時のみ)
app.use(express.json());
//「ドメイン/message」というURLに一致していた場合res(返信）としてmessageJsonという変数を返す
app.get("/message", (req, res) => {
    res.send(messageJson);
});
//ポート番号からの情報を確認(8000番ポートで起動)
app.listen(8000, () => {
    console.log("running...");
});