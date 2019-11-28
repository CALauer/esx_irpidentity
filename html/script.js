$(function () {



    $(function () {
        $('.character-box').each(function () {
            var $this = $(this);
            $this.on("click", function () {
                var e = ($(this).data('charid'));
                console.log(e)
            });
        });
    });

    $('.character-box').hover(
        function () {
            $(this).css({
                "box-shadow": "0px 0px 10px 0px rgb(172, 172, 172, .9)",
                "transition": "200ms"
            });

        }, function () {
            $(this).css({
                "box-shadow": "0px 0px 10px 0px rgb(31, 31, 31, .9)",
                "transition": "200ms"
            });
        }
    );

    $(".character-box").click(function () {
        $(".character-box").removeClass('active-char');
        $(this).addClass('active-char');
        $(".character-buttons").css({ "display": "block" });
        if ($(this).attr("data-ischar") === "true") {
            $("#delete").css({ "display": "block" });
        } else {
            $("#delete").css({ "display": "none" });
        }
    });

    $("#play_button").click(function () {
        $.post("http://esx_irpidentity/CharacterChosen", JSON.stringify({
            charid: $('.active-char').attr("data-charid")
        }));
        irpidentity.CloseUI();
    });


    $("#delete_button").click(function () {
        $.post("http://esx_irpidentity/DeleteCharacter", JSON.stringify({
            charid: $('.active-char').attr("data-charid")
        }));
        irpidentity.CloseUI();
    });
    (() => {
        irpidentity = {};

        irpidentity.ShowUI = function (data) {
            $('.main-container').css({ "display": "block" });
            if (data.characters !== null) {
                $.each(data.characters, function (index, char) {
                    if (char.charid !== 0) {
                        var charid = char.identifier.charAt(4);
                        $('[data-charid=' + charid + ']').html('<h3 class="character-fullname">' + char.firstname + ' ' + char.lastname + '</h3><div class="character-info"><p class="character-info-work"><strong>Work: </strong><span>' + char.job + '</span></p><p class="character-info-money"><strong>Cash: </strong><span>' + char.money + '</span></p><p class="character-info-bank"><strong>Bank: </strong><span>' + char.bank + '</span></p> <p class="character-info-dateofbirth"><strong>Date of birth: </strong><span>' + char.dateofbirth + '</span></p> <p class="character-info-gender"><strong>Gender: </strong><span>' + char.sex + '</span></p></div>').attr("data-ischar", "true");
                    }
                });
            }
        };
        irpidentity.CloseUI = function () {
            $.post('http://esx_irpidentity/escape', JSON.stringify({}));
        };
        $("#register").submit(function (event) {
            event.preventDefault(); // Prevent form from submitting

            // Verify date
            var date = $("#dateofbirth").val();
            var dateCheck = new Date($("#dateofbirth").val());

            if (dateCheck == "Invalid Date") {
                date == "invalid";
            }

            $.post('http://esx_irpidentity/register', JSON.stringify({
                firstname: $("#firstname").val(),
                lastname: $("#lastname").val(),
                dateofbirth: date,
                sex: $("input[type='radio'][name='sex']:checked").val(),
                height: $("#height").val()
            }));
        });

        $('#to_characters').click(function () {
            $("#register_screen").css({ "display": "none" });;
            $("#character_screen").css({ "display": "grid" });
        });

        $('#back_button').click(function () {
            $("#character_screen").css({ "display": "none" });;
            $("#register_screen").css({ "display": "grid" });
        });


        window.addEventListener('message', function (event) {
            if (event.data.type == "enableui") {
                document.body.style.display = event.data.enable ? "block" : "none";
            }

            let firstname1 = event.data.firstname1;
            let lastname1 = event.data.lastname1;
            let job1 = event.data.job1;
            let money1 = event.data.money1;
            let bank1 = event.data.bank1;
            let firstname2 = event.data.firstname2;
            let lastname2 = event.data.lastname2;
            let job2 = event.data.job2;
            let money2 = event.data.money2;
            let bank2 = event.data.bank2;
            let firstname3 = event.data.firstname3;
            let lastname3 = event.data.lastname3;
            let job3 = event.data.job3;
            let money3 = event.data.money3;
            let bank3 = event.data.bank3;

            $("#firstname1").text(firstname1);
            $("#lastname1").text(lastname1);
            $("#job1").text(job1);
            $("#bank1").text(bank1);
            $("#money1").text(money1);
            $("#firstname2").text(firstname2);
            $("#lastname2").text(lastname2);
            $("#job2").text(job2);
            $("#bank2").text(bank2);
            $("#money2").text(money2);
            $("#firstname3").text(firstname3);
            $("#lastname3").text(lastname3);
            $("#job3").text(job3);
            $("#bank3").text(bank3);
            $("#money3").text(money3);

           //To leave the UI using ESCAPE
            document.onkeyup = function (data) {
                if (data.which == 27) { // Escape key
                    $.post('http://esx_irpidentity/escape', JSON.stringify({}));
                }
            };
        });
    })();
}); 
