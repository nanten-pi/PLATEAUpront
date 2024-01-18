const express = require("express");
//インスタンスの作成
const app = express();
//JSONの作成
let messageJson = {"message": "dangers"};
let statusJson={"gps":"1",
                "titles":"hogehoge",
                "payload":"hogehoge"};
let testJson={
    //何かデータ入れ込めるかもね
    "current":{
        // 'weather'のデータを格納する
        "main":[
            {
                "id":803,
                "titles":"hogehoge",
                "payload":"とある土砂崩れ",
                "gps":"1"
            }
        ]
    }
}

//JSONを送信(ファイル実行時のみ)
app.use(express.json());
//「ドメイン/message」というURLに一致していた場合res(返信）としてmessageJsonという変数を返す
app.get("/get", (req, res) => {
    res.status(200).send(testJson);
});
//ポート番号からの情報を確認(8000番ポートで起動)
app.listen(8000, () => {
    console.log("running server");
    app.post("/",function(req, res){
    console.log(req.body);
    });
});