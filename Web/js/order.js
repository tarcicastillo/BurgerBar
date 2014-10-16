var burgerTotal = 1;
var orderPrice = 0;

$(document).ready(function(){

    populateMenu();
    setClickListeners();

});


function populateMenu() {
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
            if(i === 0) {
                $('input[id="' + meats[i].name + '"]').prop('checked', true);
            }
        }

        for(var i=0; i < buns.length; i++) {
            var html = '<input id="' + buns[i].name + '" type="radio" name="buns" value="' + buns[i].name +
                '" data-price="' + buns[i].price.toFixed(2) + '"><label for="' + buns[i].name + '">' + ' ' +
                buns[i].name + ' $' + buns[i].price.toFixed(2) + '</label><br>';
            $("#bunList").append(html);
            if(i === 0) {
                $('input[id="' + buns[i].name + '"]').prop('checked', true);
            }
        }

        for(var i=0; i < cheeses.length; i++) {
            var html =
                '<input id="' + cheeses[i].name + '" type="radio" name="cheeses" value="' + cheeses[i].name +
                    '" data-price="' + cheeses[i].price.toFixed(2) + '"><label for="' + cheeses[i].name + '">' + ' ' +
                    cheeses[i].name + ' $' + cheeses[i].price.toFixed(2) + '</label><br>';
            $("#cheeseList").append(html);
        }

        for(var i=0; i < toppings.length; i++) {
            var html =
                '<input id="' + toppings[i].name + '" type="checkbox" name="toppings" class="topping" value="' + toppings[i].name +
                    '" data-price="' + toppings[i].price.toFixed(2) + '"><label for="' + toppings[i].name + '">' + ' ' +
                    toppings[i].name + ' $' + toppings[i].price.toFixed(2) + '</label><br>';
            $("#toppingsList").append(html);
        }

        for(var i=0; i < sauces.length; i++) {
            var html =
                '<input id="' + sauces[i].name + '" type="checkbox" name="sauces" class="sauce" value="' + sauces[i].name +
                    '" data-price="' + sauces[i].price.toFixed(2) + '"><label for="' + sauces[i].name + '">' + ' ' +
                    sauces[i].name + ' $' + sauces[i].price.toFixed(2) + '</label><br>';
            $("#saucesList").append(html);
        }

        for(var i=0; i < sides.length; i++) {
            var html =
                '<input id="' + sides[i].name + '" type="radio" name="sides" value="' + sides[i].name +
                    '" data-price="' + sides[i].price.toFixed(2) + '"><label for="' + sides[i].name + '">' + ' ' +
                    sides[i].name + ' $' + sides[i].price.toFixed(2) + '</label><br>';
            $("#sidesList").append(html);
        }
    });
}

function setClickListeners() {

    jQuery('#NoToppings').click(function() {
        var current = $(this);
        jQuery('.topping').each(function(v) {
            $(this).prop('checked', false);
        })
    });

    jQuery('#NoSauce').click(function() {
        var current = $(this);
        jQuery('.sauce').each(function(v) {
            $(this).prop('checked', false);
        })
    });

    $('#addToOrder').click(function() {
        var burgerPrice = 0;
        var html = "<div><h2>Custom Burger " + burgerTotal + "</h2><ul>";

        var selectedMeat = $("input[type='radio'][name='meats']:checked");
        var meatPrice = selectedMeat.data("price");
        var meatName = selectedMeat.val();
        console.log(meatPrice + "---" + meatName);
        burgerPrice = burgerPrice + parseFloat(meatPrice);
        html = html + "<li>" + meatName + "</li>";

        var selectedBun = $("input[type='radio'][name='buns']:checked");
        var bunName = selectedBun.val();
        var bunPrice = selectedBun.data("price");
        console.log(bunPrice + "---" + bunName);
        burgerPrice = burgerPrice + parseFloat(bunPrice);
        html = html + "<li>" + bunName + "</li>";

        var selectedCheese = $("input[type='radio'][name='cheeses']:checked");
        var cheeseName = selectedCheese.val();
        var cheesePrice = selectedCheese.data("price");
        console.log(cheesePrice + "---" + cheeseName);
        burgerPrice = burgerPrice + parseFloat(cheesePrice);
        html = html + "<li>" + cheeseName + "</li>";

        var selectedToppings = $("input[type='checkbox'][name='toppings']:checked");
        html = html + "<li>Toppings</li><ul>";
        for (var i = 0; i < selectedToppings.length; i++) {
            console.log(parseFloat($(selectedToppings[i]).data("price")) + "---" + selectedToppings[i].value);
            burgerPrice = burgerPrice + parseFloat($(selectedToppings[i]).data("price"));
            html = html + "<li>" + selectedToppings[i].value + "</li>"
        }
        html = html + "</ul>";

        var selectedSauces = $("input[type='checkbox'][name='sauces']:checked");
        html = html + "<li>Sauces</li><ul>";
        for (var i = 0; i < selectedSauces.length; i++) {
            console.log(parseFloat($(selectedSauces[i]).data("price")) + "---" + selectedSauces[i].value);
            burgerPrice = burgerPrice + parseFloat($(selectedSauces[i]).data("price"));
            html = html + "<li>" + selectedSauces[i].value + "</li>"
        }
        html = html + "</ul>";

        var selectedSide = $("input[type='radio'][name='sides']:checked");
        var sideName = selectedSide.val();
        var sidePrice = selectedSide.data("price");
        console.log(sidePrice + "---" + sideName);
        burgerPrice = burgerPrice + parseFloat(sidePrice);
        html = html + "<li>" + sideName + "</li>";

        html = html + "</ul></div>";
        burgerTotal = burgerTotal + 1;
        $('#orderDetails').append(html);
        $('#totalSpan').text('' + burgerPrice.toFixed(2));
    });
}
