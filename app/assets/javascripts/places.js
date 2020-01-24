// $(function(){

//   let list = $("#list")
//   var fruits = ['apple', 'apricot', 'avocado', 'blueberry', 'cherry', 'coconut', 'cranberry', 'dragonfruit', 'durian', 'grape', 'grapefruit', 'guava', 'kiwi fruit', 'lemon', 'lime', 'lychee', 'mango', 'melon', 'watermelon', 'miracle fruit', 'orange', 'bloodorange','clementine','mandarine','tangerine','papaya','passionfruit','peach','pear','persimmon','physalis','plum/prune','pineapple','pomegranate','raspberry','rambutan','star fruit','strawberry'];
  
//     // append()を使って、listに値を出力するappendList(word)関数としてまとめる
//     // !!!【 対象要素.append( 追加したい要素 ) 】
//     function appendList(word) {
//       // 処理
//       let item = $('<li class="list">').append(word);
//       list.append(item);
//     }

//     // // 変数展開使ったバージョン
//     // function appendList(word) {
//     //     $('ul').append(`<li class="list">${word}</li>`)
//     // }
    
//     //  //間違いバージョン、wordが中に入らない
//     // function appendList(word) {
//     //   item = $('ul').append('<li class="list">')
//     //   item.append(word)
//     // }
      


//     function editElement(element) {
//       let result = "^" + element;
//       return result;
//     }
  
//     $("#submit").on("click", function() {
//       let input = $("#keyword").val();
//       // 正規表現オブジェクトを生成し、変数に格納する
//       let inputs = input.split(" ")
//       let newInputs = inputs.map(editElement);
//       let reg = new RegExp(newInputs.join("|"));
//       console.log(reg)
      
//       // listクラスを取り除く 
//       $(".list").remove();
  
//       $.each(fruits, function(i, fruit) {
//         // fruitとマッチしたらlistクラスに出力する
//         if (fruit.match(reg)) {
//           appendList(fruit);
//         }
//       });
  
//       if ($(".list").length === 0) {
//         appendList("一致する果物はありませんでした");
//       }
//     });
//   });


$(function(){
  $(".main_menu li").hover(
    function() {
    $(this).children('ul').show();
},
    function() {
    $(this).children('ul').hide();
});                      
       });  