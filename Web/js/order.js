$(document).ready(function(){

    $.getJSON("menu.json", function(json) {

        var meats = json.menu.meats;
        var buns = json.menu.buns;
        var cheeses = json.menu.cheeses;
        var toppings = json.menu.toppings;
        var sauces = json.menu.sauces;
        var sides = json.menu.sides;

        for(var i=0; i < meats.length; i++) {
            var html = '<input id="' + meats[i].name + '" type="radio" name="meats" value="' + meats[i].name +
                    '" data-price="' + meats[i].price.toFixed(2) + '"><label for="' + meats[i].name + '">' + ' ' +
                    meats[i].name + ' $' + meats[i].price.toFixed(2) + '</label><br>';
            $("#meatList").append(html);
        }

        for(var i=0; i < buns.length; i++) {
            var html = '<input id="' + buns[i].name + '" type="radio" name="meats" value="' + buns[i].name +
                    '" data-price="' + buns[i].price.toFixed(2) + '"><label for="' + buns[i].name + '">' + ' ' +
                    buns[i].name + ' $' + buns[i].price.toFixed(2) + '</label><br>';
            $("#bunList").append(html);
        }

        for(var i=0; i < cheeses.length; i++) {
            var html =
                '<input id="' + cheeses[i].name + '" type="radio" name="meats" value="' + cheeses[i].name +
                    '" data-price="' + cheeses[i].price.toFixed(2) + '"><label for="' + cheeses[i].name + '">' + ' ' +
                    cheeses[i].name + ' $' + cheeses[i].price.toFixed(2) + '</label><br>';
            $("#cheeseList").append(html);
        }

        for(var i=0; i < toppings.length; i++) {
            var html =
                '<input id="' + toppings[i].name + '" type="checkbox" name="meats" value="' + toppings[i].name +
                    '" data-price="' + toppings[i].price.toFixed(2) + '"><label for="' + toppings[i].name + '">' + ' ' +
                    toppings[i].name + ' $' + toppings[i].price.toFixed(2) + '</label><br>';
            $("#toppingsList").append(html);
        }

        for(var i=0; i < sauces.length; i++) {
            var html =
                '<input id="' + sauces[i].name + '" type="checkbox" name="meats" value="' + sauces[i].name +
                    '" data-price="' + sauces[i].price.toFixed(2) + '"><label for="' + sauces[i].name + '">' + ' ' +
                    sauces[i].name + ' $' + sauces[i].price.toFixed(2) + '</label><br>';
            $("#saucesList").append(html);
        }

        for(var i=0; i < sides.length; i++) {
            var html =
                '<input id="' + sides[i].name + '" type="radio" name="meats" value="' + sides[i].name +
                    '" data-price="' + sides[i].price.toFixed(2) + '"><label for="' + sides[i].name + '">' + ' ' +
                    sides[i].name + ' $' + sides[i].price.toFixed(2) + '</label><br>';
            $("#sidesList").append(html);
        }
    });

});