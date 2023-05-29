document.getElementById('spin').addEventListener('click', function() {
    var items 
      = ["カフェ", 
         "BGM", 
         "散歩", 
         "ランニング", 
         "風呂",
         "瞑想"]; // ルーレットのアイテムをリスト形式で入力

    var result = items[Math.floor(Math.random() * items.length)]; // ランダムにアイテムを選びます

    document.getElementById('result').textContent = result; // ルーレットの結果を表示
});
