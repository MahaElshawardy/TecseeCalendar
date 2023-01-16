<style>
    *{ldelim}margin: 0;padding: 0;-webkit-box-sizing: border-box;box-sizing: border-box;outline: none;border: none;text-transform: capitalize;-webkit-transition: all 0.2s ease-out;transition: all 0.2s ease-out;text-decoration: none;{rdelim}
    .tecSee-table-parent .tecSee-table-title-and-search{ldelim}display: -webkit-box;display: -ms-flexbox;display: flex;-ms-flex-wrap: wrap;flex-wrap: wrap;-webkit-box-pack: justify;-ms-flex-pack: justify;justify-content: space-between;padding: 15px;-webkit-box-align: center;-ms-flex-align: center;align-items: center;{rdelim}
    .tecSee-table-parent .tecSee-table-title-and-search h2{ldelim}margin: 0;padding: 0;font-weight: 900;font-size: 25px;-ms-flex-preferred-size: 40%;flex-basis: 40%;{rdelim}
    .tecSee-table-parent .tecSee-table-title-and-search input[type="search"]{ldelim}border: 1px solid #b3b3b3;border-radius: 5px;-ms-flex-preferred-size: 30%;flex-basis: 30%;padding: 15px;font-size: 18px;{rdelim}
    .tecSee-table-parent .tecSee-table-container{ldelim}width: 100%;overflow: hidden;{rdelim}
    .tecSee-table-parent .tecSee-table-container{ldelim}width: 100%;overflow: hidden;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding{ldelim}width: 100%;overflow: auto;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding::-webkit-scrollbar-track{ldelim}background-color: #f1f2f6;border-radius: 15px;width: 10px;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding::-webkit-scrollbar{ldelim}background: white;border-radius: 15px;width: 10px;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding::-webkit-scrollbar-thumb{ldelim}background-color: #5cbcf6;border-radius: 15px;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table{ldelim}width: 100%;border-collapse: collapse;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table th{ldelim}background-color: #5cbcf6;padding: 15px;color: white;border: 1px solid #b3b3b3;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table tr td{ldelim}padding: 15px;border: 1px solid #b3b3b3;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table tr td:nth-child(odd){ldelim}background-color: #e9ecf8;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table tr td p{ldelim}max-width: 200px;width: -webkit-fit-content;width: -moz-fit-content;width: fit-content;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table tr td button{ldelim}padding: 15px;border-radius: 5px;color: white;cursor: pointer;font-size: 18px;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table tr td button.tecSee-button-click{ldelim}background-color: #5cbcf6;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table tr td button.tecSee-button-edit{ldelim}background-color: #0b6aa2;{rdelim}
    .tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table tr td button.tecSee-button-delete{ldelim}background-color: #e10505;{rdelim}
    .tecSee-form .tecSee-invalid{ldelim}border: #ff4949 solid 2px{rdelim}
    .tecSee-form{ldelim}display: -webkit-box;display: -ms-flexbox;display: flex;-ms-flex-wrap: wrap;flex-wrap: wrap;margin: 10px 0;{rdelim}
    .tecSee-form div,.tecSee-form .full-width{ldelim}margin: 0 10px 0 20px;-ms-flex-preferred-size: calc((100% - 60px) / 2);flex-basis: calc((100% - 60px) / 2);display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-orient: vertical;-webkit-box-direction: normal;-ms-flex-direction: column;flex-direction: column;gap: 20px;padding: 15px;{rdelim}
    .tecSee-form div.tecSee-break,.tecSee-form .full-width.tecSee-break{ldelim}-ms-flex-preferred-size: 100%;flex-basis: 100%;height: 0;{rdelim}
    .tecSee-form div label,.tecSee-form .full-width label{ldelim}font-size: 18px;font-weight: bolder;{rdelim}.tecSee-form div input,.tecSee-form div textarea,.tecSee-form div select,.tecSee-form .full-width input,.tecSee-form .full-width select{ldelim}padding: 15px;border-radius: 5px;border: 1px solid #b3b3b3;resize:none;{rdelim}
    .tecSee-form div select option,.tecSee-form .full-width select option{ldelim}font-size: 17px;{rdelim}
    .tecSee-form .full-width{ldelim}-ms-flex-preferred-size: 100%;flex-basis: 100%;{rdelim}
    .tecSee-form button,.tecSee-form input[type="submit"]{ldelim}-ms-flex-preferred-size: calc((100% - 60px) / 2);flex-basis: calc((100% - 60px) / 2);background-color: #5cbcf6;border-radius: 5px;padding: 15px;color: #e9ecf8;display: block;margin: 0 auto;{rdelim}
    .tecSee-form .triple-div{ldelim}flex-basis: calc((100% - 60px) / 4);{rdelim}
    .tecSee-form .plus-button{ldelim}flex-basis: calc((100% - 60px) / 10);height: fit-content;margin-top: 7%;{rdelim}
    .tecSee-form .error{ldelim}border: 1px  solid red;{rdelim}
    .c-select{ldelim}padding: 8px;border-radius: 5px;border: 1px solid #b3b3b3;resize: none;width:250px{rdelim}
    .w-fit{ldelim}width: fit-content;{rdelim}
    .border-error{ldelim}border: 1px solid red !important;{rdelim}
    .dflex-column{ldelim}display:felx; flex-direction:column; justify-content:center; align-items:center;{rdelim}
    .w40{ldelim}width: 40%;{rdelim}
    .loading-screen{ldelim}width: 100vw; height : 100vh; color:white; position:fixed; top:0; left:0; background-color:rgba(0,0,0,0.5); display:none;justify-content:center; align-items:center{rdelim}
    .errors{ldelim}text-align: start;color: red;{rdelim}
    .errors small{ldelim}margin-left: -70px; color:red; margin-bottom:15px; display:block{rdelim}
    .tecSee-form .error-mes{ldelim}display: none;{rdelim}
    .tecSee-form .show-error{ldelim}display: block; color:red{rdelim}
    .tecSee-icon{rdelim}border:0px;font-weight: bold;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form{ldelim}height: fit-content;display: -webkit-box;display: -ms-flexbox;display: flex;-ms-flex-wrap: wrap;flex-wrap: wrap;margin: 10px 0;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form div,.tecSee-form .full-width{ldelim}margin: 0 10px 0 20px;-ms-flex-preferred-size: 100%;flex-basis: 100%;display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-orient: vertical;-webkit-box-direction: normal;-ms-flex-direction: column;flex-direction: column;gap: 20px;padding: 15px;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form div.tecSee-break,.tecSee-form .full-width.tecSee-break{ldelim}-ms-flex-preferred-size: 100%;flex-basis: 100%;height: 0;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form div label,.tecSee-form .full-width label{ldelim}font-size: 18px;font-weight: bolder;{rdelim}.tecSee-form div input,.tecSee-form div textarea,.tecSee-form div select,.tecSee-form .full-width input,.tecSee-form .full-width select{ldelim}padding: 15px;border-radius: 5px;border: 1px solid #b3b3b3;resize:none;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form div select option,.tecSee-form .full-width select option{ldelim}font-size: 17px;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form .full-width{ldelim}-ms-flex-preferred-size: 100%;flex-basis: 100%;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form button,.tecSee-form input[type="submit"]{ldelim}-ms-flex-preferred-size: calc((100% - 60px) / 2);flex-basis: calc((100% - 60px) / 2);background-color: #5cbcf6;border-radius: 5px;padding: 15px;color: #e9ecf8;display: block;margin: 0 auto;{rdelim}
    .modal {ldelim}width: 50%;margin: 0 auto;background-color:unset;left: 50%; transform: translateX(-50%);max-height: 90vh;top: 5%; bottom: 10%; padding:0;{rdelim}
    .modal .modal-dialog .modal-header{ldelim}position: relative;{rdelim}
    .modal .modal-dialog .modal-header h4{ldelim}font-weight: 900;font-size: 20px;text-align: center;padding: 15px;{rdelim}
    .modal .modal-dialog .modal-header i{ldelim}color: #e10505;position: absolute;top: 5px;right: 10px;font-size: 20px;cursor: pointer;font-weight: 900;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form .triple-div{ldelim}width: 5%; margin-inline: 0%;{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form .triple-div{ldelim}flex-basis: calc((100% - 60px) / 4);{rdelim}
    .modal .modal-dialog .modal-content .modal-body .tecSee-form .plus-button{ldelim}flex-basis: calc((100% - 60px) / 10);height: fit-content;margin-top: 14%;{rdelim}
    .tecSee-loading-container{ldelim}position: absolute; display: flex; justify-content: center; align-items: center; width:65%;{rdelim}
    .pop-up-container {ldelim}position: fixed;top: 0;left: 0;right: 0;bottom: 0;z-index: 1500;background: rgba(0, 0, 0, 0.4);display: none;{rdelim}
    .pop-up-container.active {ldelim}display: block;{rdelim}
    .pop-up-container.remove {ldelim}animation: removeBox 0.1s linear forwards;{rdelim}
    .pop-up-container .pop-up-content-parent {ldelim}display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: center;-ms-flex-pack: center;justify-content: center;height: 100%;width: 100%;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content {ldelim}width: 400px;height: 300px;max-width: 400px;padding: 25px;border-radius: 5px;background: #fff;color: #545454;display: -webkit-box;display: -ms-flexbox;display: flex;-webkit-box-orient: vertical;-webkit-box-direction: normal;-ms-flex-direction: column;flex-direction: column;-webkit-box-align: center;-ms-flex-align: center;align-items: center;-webkit-box-pack: space-evenly;-ms-flex-pack: space-evenly;justify-content: space-evenly;position: relative;transform: scale(0);{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content.active {ldelim}animation: upperBox 0.2s linear forwards;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content.remove {ldelim}animation: removeBox 0.05s linear forwards;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content #close-rental-car-popup {ldelim}position: absolute;right: 10px;top: 10px;font-size: 24px;font-weight: bolder;cursor: pointer;color: #ff5ca3;z-index: 10;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content img {ldelim}width: 95px;animation: rotateImg 0.4s 0.1s linear forwards;transform: rotate(45deg);opacity: 0;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content div.pop-up-message {ldelim}margin-top: 5px; margin-bottom:5px{rdelim}    
    .pop-up-container .pop-up-content-parent .pop-up-content p.pop-up-message {ldelim}color: #545454;font-size: 22px;{rdelim}    
    .pop-up-container .pop-up-content-parent .pop-up-content div.button-container .pop-up-button {ldelim}background-color: #ff5ca3;border-radius: 5px;font-size: 19px;font-weight: bold;padding: 10px;color: white;margin: 0 5px;display: inline-block;text-decoration: none;outline: none;border: none; min-width:100px;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content div p.proceed-message {ldelim}color: #545454;margin-bottom: 15px;font-size: 20px;text-align: center;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content div .pop-up-button#confirm-pop-up-screen {ldelim}background-color: #25c6da;{rdelim}
    .pop-up-container .pop-up-content-parent .pop-up-content div .pop-up-button#confirm-pop-up-screen.active {ldelim}display: inline-block !important;{rdelim}
    .x-icon {ldelim}align-self: start !important; cursor: pointer;{rdelim}
    .pop-up-icon {ldelim}margin-bottom: align-self: ;{rdelim}
    @keyframes upperBox {ldelim}0% {ldelim}transform: scale(0);opacity: 0;{rdelim}50% {ldelim}transform: scale(0.5);opacity: 1;{rdelim}100% {ldelim}transform: scale(1);opacity: 1;{rdelim}{rdelim}
    @keyframes removeBox {ldelim}0% {ldelim}transform: scale(1);opacity: 1;{rdelim}50% {ldelim}transform: scale(0.5);opacity: 0.5;{rdelim}100% {ldelim}transform: scale(0);opacity: 0;display: none;{rdelim}{rdelim}
    @keyframes rotateImg {ldelim}0% {ldelim}opacity: 0;{rdelim}30% {ldelim}transform: rotate(-20deg);opacity: 1;{rdelim}60% {ldelim}transform: rotate(20deg);opacity: 1;{rdelim}100% {ldelim}transform: rotate(0);opacity: 1;{rdelim}{rdelim}
    @media max-width: 1200px{ldelim}.tecSee-table-parent .tecSee-table-container .tecSee-remove-padding .tecSee-table{ldelim}margin-bottom: 15px;{rdelim} {rdelim} 
    @media max-width: 1200px{ldelim}.tecSee-table-parent .tecSee-table-container{ldelim}padding: 15px;{rdelim} {rdelim} 
    @media max-width: 768px{ldelim}.tecSee-table-parent .tecSee-table-title-and-search{ldelim}gap: 20px;{rdelim}.tecSee-table-parent .tecSee-table-title-and-search h2{ldelim}text-align: center;-ms-flex-preferred-size: 100%;flex-basis: 100%;{rdelim}.tecSee-table-parent .tecSee-table-title-and-search input[type="search"]{ldelim}-ms-flex-preferred-size: 100%;flex-basis: 100%;{rdelim}{rdelim} 
    @import url(https://kit.fontawesome.com/23268b53f1.js);

    {* ================================ start licenses *}
    .tecSee-overlay-licenses{ldelim}
    position: fixed;
    height: 100vh;
    width: 100vw;
    background: rgba(255, 255, 255, 0.7);
    top: 0;
    left: 0;
    z-index:1030;
    display: flex;
    justify-content: center;
    align-items: center;
    {rdelim}
    .tecSee-licenses-container{ldelim}
    width: 500px;
    background-color: rgba(11, 11, 11, 0.4);
    border-radius: 10px;
    color: white;
    {rdelim}
    .tecSee-licenses-container .content{ldelim}
    width: 80%;
    margin: auto;
    margin-top: 10px;
    {rdelim}
    {* ================================ end licenses *}


    .btn-file {ldelim}
    margin: 0;
    padding: 0;
    position: relative;
    z-index: 1;
    {rdelim}

    .btn-file__actions__item {ldelim}
    padding: 35px 275px;
    font-size: 1.5em;
    color: #b3b3b3;
    cursor: pointer;
    text-decoration: none;
    border-top: 3px dashed #b3b3b3;
    border-left: 3px dashed #b3b3b3;
    border-bottom: 3px dashed #b3b3b3;
    {rdelim}

    .btn-file__actions__item:first-child {ldelim}
    border-top-left-radius: 35px;
    border-bottom-left-radius: 35px;
    {rdelim}

    .btn-file__actions__item:last-child {ldelim}
    border-top-right-radius: 35px;
    border-bottom-right-radius: 35px;
    border-right: 3px dashed #b3b3b3;
    {rdelim}

    .btn-file__actions__item:hover,
    .btn-file__actions__item:focus {ldelim}
    color: #636b6f;
    background-color: rgba(211, 224, 233, 0.1);
    {rdelim}

    .btn-file__actions__item:hover--shadow,
    .btn-file__actions__item:focus--shadow {ldelim}
    box-shadow: #b3b3b3 0 0 60px 15px;
    {rdelim}

    .btn-file__actions__item--shadow {ldelim}
    width:100% display: inline-block;
    position: relative;
    z-index: 1;
    {rdelim}

    .btn-file__actions__item--shadow::before {ldelim}
    content: " ";
    box-shadow: #fff 0 0 60px 40px;
    display: inline-block;
    position: absolute;
    top: 50%;
    left: 0;
    width: 100%;
    z-index: -1;
    {rdelim}

    .btn-file__preview {ldelim}
    opacity: 0.5;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    position: absolute;
    z-index: -1;
    border-radius: 35px;
    background-size: cover;
    background-position: center;
    {rdelim}

    .form-group label.attachment {ldelim}
    width: 100%;
    {rdelim}

    .form-group label.attachment .btn-create>a,
    .form-group label.attachment .btn-create>div {ldelim}
    margin-top: 5px;
    {rdelim}

    .form-group label.attachment input[type='file'] {ldelim}
    display: none;
    {rdelim}

    {* ========================================= date picker *}

    .datepicker {ldelim}
    padding: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    direction: ltr;
    {rdelim}

    .datepicker-inline {ldelim}
    width: 220px;
    {rdelim}

    .datepicker-rtl {ldelim}
    direction: rtl;
    {rdelim}

    .datepicker-rtl.dropdown-menu {ldelim}
    left: auto;
    {rdelim}

    .datepicker-rtl table tr td span {ldelim}
    float: right;
    {rdelim}

    .datepicker-dropdown {ldelim}
    top: 0;
    left: 0;
    {rdelim}

    .datepicker-dropdown:before {ldelim}
    content: '';
    display: inline-block;
    border-left: 7px solid transparent;
    border-right: 7px solid transparent;
    border-bottom: 7px solid #999;
    border-top: 0;
    border-bottom-color: rgba(0, 0, 0, 0.2);
    position: absolute;
    {rdelim}

    .datepicker-dropdown:after {ldelim}
    content: '';
    display: inline-block;
    border-left: 6px solid transparent;
    border-right: 6px solid transparent;
    border-bottom: 6px solid #fff;
    border-top: 0;
    position: absolute;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-left:before {ldelim}
    left: 6px;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-left:after {ldelim}
    left: 7px;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-right:before {ldelim}
    right: 6px;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-right:after {ldelim}
    right: 7px;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-bottom:before {ldelim}
    top: -7px;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-bottom:after {ldelim}
    top: -6px;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-top:before {ldelim}
    bottom: -7px;
    border-bottom: 0;
    border-top: 7px solid #999;
    {rdelim}

    .datepicker-dropdown.datepicker-orient-top:after {ldelim}
    bottom: -6px;
    border-bottom: 0;
    border-top: 6px solid #fff;
    {rdelim}

    .datepicker table {ldelim}
    margin: 0;
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    {rdelim}

    .datepicker td,
    .datepicker th {ldelim}
    text-align: center;
    width: 20px;
    height: 20px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    border-radius: 4px;
    border: none;
    {rdelim}

    .table-striped .datepicker table tr td,
    .table-striped .datepicker table tr th {ldelim}
    background-color: transparent;
    {rdelim}

    .datepicker table tr td.day:hover,
    .datepicker table tr td.day.focused {ldelim}
    background: #eee;
    cursor: pointer;
    {rdelim}

    .datepicker table tr td.old,
    .datepicker table tr td.new {ldelim}
    color: #999;
    {rdelim}

    .datepicker table tr td.disabled,
    .datepicker table tr td.disabled:hover {ldelim}
    background: none;
    color: #999;
    cursor: default;
    {rdelim}

    .datepicker table tr td.highlighted {ldelim}
    background: #d9edf7;
    border-radius: 0;
    {rdelim}

    .datepicker table tr td.today,
    .datepicker table tr td.today:hover,
    .datepicker table tr td.today.disabled,
    .datepicker table tr td.today.disabled:hover {ldelim}
    background-color: #fde19a;
    background-image: -moz-linear-gradient(to bottom, #fdd49a, #fdf59a);
    background-image: -ms-linear-gradient(to bottom, #fdd49a, #fdf59a);
    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#fdd49a), to(#fdf59a));
    background-image: -webkit-linear-gradient(to bottom, #fdd49a, #fdf59a);
    background-image: -o-linear-gradient(to bottom, #fdd49a, #fdf59a);
    background-image: linear-gradient(to bottom, #fdd49a, #fdf59a);
    background-repeat: repeat-x;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fdd49a', endColorstr='#fdf59a', GradientType=0);
    border-color: #fdf59a #fdf59a #fbed50;
    border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
    color: #000;
    {rdelim}

    .datepicker table tr td.today:hover,
    .datepicker table tr td.today:hover:hover,
    .datepicker table tr td.today.disabled:hover,
    .datepicker table tr td.today.disabled:hover:hover,
    .datepicker table tr td.today:active,
    .datepicker table tr td.today:hover:active,
    .datepicker table tr td.today.disabled:active,
    .datepicker table tr td.today.disabled:hover:active,
    .datepicker table tr td.today.active,
    .datepicker table tr td.today:hover.active,
    .datepicker table tr td.today.disabled.active,
    .datepicker table tr td.today.disabled:hover.active,
    .datepicker table tr td.today.disabled,
    .datepicker table tr td.today:hover.disabled,
    .datepicker table tr td.today.disabled.disabled,
    .datepicker table tr td.today.disabled:hover.disabled,
    .datepicker table tr td.today[disabled],
    .datepicker table tr td.today:hover[disabled],
    .datepicker table tr td.today.disabled[disabled],
    .datepicker table tr td.today.disabled:hover[disabled] {ldelim}
    background-color: #fdf59a;
    {rdelim}

    .datepicker table tr td.today:active,
    .datepicker table tr td.today:hover:active,
    .datepicker table tr td.today.disabled:active,
    .datepicker table tr td.today.disabled:hover:active,
    .datepicker table tr td.today.active,
    .datepicker table tr td.today:hover.active,
    .datepicker table tr td.today.disabled.active,
    .datepicker table tr td.today.disabled:hover.active {ldelim}
    background-color: #fbf069 \9;
    {rdelim}

    .datepicker table tr td.today:hover:hover {ldelim}
    color: #000;
    {rdelim}

    .datepicker table tr td.today.active:hover {ldelim}
    color: #fff;
    {rdelim}

    .datepicker table tr td.range,
    .datepicker table tr td.range:hover,
    .datepicker table tr td.range.disabled,
    .datepicker table tr td.range.disabled:hover {ldelim}
    background: #eee;
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    {rdelim}

    .datepicker table tr td.range.today,
    .datepicker table tr td.range.today:hover,
    .datepicker table tr td.range.today.disabled,
    .datepicker table tr td.range.today.disabled:hover {ldelim}
    background-color: #f3d17a;
    background-image: -moz-linear-gradient(to bottom, #f3c17a, #f3e97a);
    background-image: -ms-linear-gradient(to bottom, #f3c17a, #f3e97a);
    background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#f3c17a), to(#f3e97a));
    background-image: -webkit-linear-gradient(to bottom, #f3c17a, #f3e97a);
    background-image: -o-linear-gradient(to bottom, #f3c17a, #f3e97a);
    background-image: linear-gradient(to bottom, #f3c17a, #f3e97a);
    background-repeat: repeat-x;
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#f3c17a', endColorstr='#f3e97a', GradientType=0);
    border-color: #f3e97a #f3e97a #edde34;
    border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
    filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
    -webkit-border-radius: 0;
    -moz-border-radius: 0;
    border-radius: 0;
    {rdelim}

    .datepicker table tr td.range.today:hover,
    .datepicker table tr td.range.today:hover:hover,
    .datepicker table tr td.range.today.disabled:hover,
    .datepicker table tr td.range.today.disabled:hover:hover,
    .datepicker table tr td.range.today:active,
    .datepicker table tr td.range.today:hover:active,
    .datepicker table tr td.range.today.disabled:active,
    .datepicker table tr td.range.today.disabled:hover:active,
    .datepicker table tr td.range.today.active,
    .datepicker table tr td.range.today:hover.active,
    .datepicker table tr td.range.today.disabled.active,
    .datepicker table tr td.range.today.disabled:hover.active,
    .datepicker table tr td.range.today.disabled,
    .datepicker table tr td.range.today:hover.disabled,
    .datepicker table tr td.range.today.disabled.disabled,
    .datepicker table tr td.range.today.disabled:hover.disabled,
    .datepicker table tr td.range.today[disabled],
    .datepicker table tr td.range.today:hover[disabled],
    .datepicker table tr td.range.today.disabled[disabled],
    .datepicker table tr td.range.today.disabled:hover[disabled] {ldelim}
    background-color: #f3e97a;
    {rdelim}

    .datepicker table tr td.range.today:active,
    .datepicker table tr td.range.today:hover:active,
    .datepicker table tr td.range.today.disabled:active,
    .datepicker table tr td.range.today.disabled:hover:active,
    .datepicker table tr td.range.today.active,
    .datepicker table tr td.range.today:hover.active,
    .datepicker table tr td.range.today.disabled.active,
    .datepicker table tr td.range.today.disabled:hover.active {
        background-color: #efe24b \9;
        {rdelim}

        .datepicker table tr td.selected,
        .datepicker table tr td.selected:hover,
        .datepicker table tr td.selected.disabled,
        .datepicker table tr td.selected.disabled:hover {ldelim}
        background-color: #9e9e9e;
        background-image: -moz-linear-gradient(to bottom, #b3b3b3, #808080);
        background-image: -ms-linear-gradient(to bottom, #b3b3b3, #808080);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#b3b3b3), to(#808080));
        background-image: -webkit-linear-gradient(to bottom, #b3b3b3, #808080);
        background-image: -o-linear-gradient(to bottom, #b3b3b3, #808080);
        background-image: linear-gradient(to bottom, #b3b3b3, #808080);
        background-repeat: repeat-x;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#b3b3b3', endColorstr='#808080', GradientType=0);
        border-color: #808080 #808080 #595959;
        border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
        filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        color: #fff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
        {rdelim}

        .datepicker table tr td.selected:hover,
        .datepicker table tr td.selected:hover:hover,
        .datepicker table tr td.selected.disabled:hover,
        .datepicker table tr td.selected.disabled:hover:hover,
        .datepicker table tr td.selected:active,
        .datepicker table tr td.selected:hover:active,
        .datepicker table tr td.selected.disabled:active,
        .datepicker table tr td.selected.disabled:hover:active,
        .datepicker table tr td.selected.active,
        .datepicker table tr td.selected:hover.active,
        .datepicker table tr td.selected.disabled.active,
        .datepicker table tr td.selected.disabled:hover.active,
        .datepicker table tr td.selected.disabled,
        .datepicker table tr td.selected:hover.disabled,
        .datepicker table tr td.selected.disabled.disabled,
        .datepicker table tr td.selected.disabled:hover.disabled,
        .datepicker table tr td.selected[disabled],
        .datepicker table tr td.selected:hover[disabled],
        .datepicker table tr td.selected.disabled[disabled],
        .datepicker table tr td.selected.disabled:hover[disabled] {ldelim}
        background-color: #808080;
        {rdelim}

        .datepicker table tr td.selected:active,
        .datepicker table tr td.selected:hover:active,
        .datepicker table tr td.selected.disabled:active,
        .datepicker table tr td.selected.disabled:hover:active,
        .datepicker table tr td.selected.active,
        .datepicker table tr td.selected:hover.active,
        .datepicker table tr td.selected.disabled.active,
        .datepicker table tr td.selected.disabled:hover.active {ldelim}
        background-color: #666666 \9;
        {rdelim}

        .datepicker table tr td.active,
        .datepicker table tr td.active:hover,
        .datepicker table tr td.active.disabled,
        .datepicker table tr td.active.disabled:hover {ldelim}
        background-color: #006dcc;
        background-image: -moz-linear-gradient(to bottom, #08c, #0044cc);
        background-image: -ms-linear-gradient(to bottom, #08c, #0044cc);
        background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#08c), to(#0044cc));
        background-image: -webkit-linear-gradient(to bottom, #08c, #0044cc);
        background-image: -o-linear-gradient(to bottom, #08c, #0044cc);
        background-image: linear-gradient(to bottom, #08c, #0044cc);
        background-repeat: repeat-x;
        filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#08c', endColorstr='#0044cc', GradientType=0);
        border-color: #0044cc #0044cc #002a80;
        border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
        filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
        color: #fff;
        text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
        {rdelim}

        .datepicker table tr td.active:hover,
        .datepicker table tr td.active:hover:hover,
        .datepicker table tr td.active.disabled:hover,
        .datepicker table tr td.active.disabled:hover:hover,
        .datepicker table tr td.active:active,
        .datepicker table tr td.active:hover:active,
        .datepicker table tr td.active.disabled:active,
        .datepicker table tr td.active.disabled:hover:active,
        .datepicker table tr td.active.active,
        .datepicker table tr td.active:hover.active,
        .datepicker table tr td.active.disabled.active,
        .datepicker table tr td.active.disabled:hover.active,
        .datepicker table tr td.active.disabled,
        .datepicker table tr td.active:hover.disabled,
        .datepicker table tr td.active.disabled.disabled,
        .datepicker table tr td.active.disabled:hover.disabled,
        .datepicker table tr td.active[disabled],
        .datepicker table tr td.active:hover[disabled],
        .datepicker table tr td.active.disabled[disabled],
        .datepicker table tr td.active.disabled:hover[disabled] {ldelim}
        background-color: #0044cc;
        {rdelim}

        .datepicker table tr td.active:active,
        .datepicker table tr td.active:hover:active,
        .datepicker table tr td.active.disabled:active,
        .datepicker table tr td.active.disabled:hover:active,
        .datepicker table tr td.active.active,
        .datepicker table tr td.active:hover.active,
        .datepicker table tr td.active.disabled.active,
        .datepicker table tr td.active.disabled:hover.active {
            background-color: #003399 \9;
            {rdelim}

            .datepicker table tr td span {ldelim}
            display: block;
            width: 23%;
            height: 54px;
            line-height: 54px;
            float: left;
            margin: 1%;
            cursor: pointer;
            -webkit-border-radius: 4px;
            -moz-border-radius: 4px;
            border-radius: 4px;
            {rdelim}

            .datepicker table tr td span:hover,
            .datepicker table tr td span.focused {ldelim}
            background: #eee;
            {rdelim}

            .datepicker table tr td span.disabled,
            .datepicker table tr td span.disabled:hover {ldelim}
            background: none;
            color: #999;
            cursor: default;
            {rdelim}

            .datepicker table tr td span.active,
            .datepicker table tr td span.active:hover,
            .datepicker table tr td span.active.disabled,
            .datepicker table tr td span.active.disabled:hover {ldelim}
            background-color: #006dcc;
            background-image: -moz-linear-gradient(to bottom, #08c, #0044cc);
            background-image: -ms-linear-gradient(to bottom, #08c, #0044cc);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#08c), to(#0044cc));
            background-image: -webkit-linear-gradient(to bottom, #08c, #0044cc);
            background-image: -o-linear-gradient(to bottom, #08c, #0044cc);
            background-image: linear-gradient(to bottom, #08c, #0044cc);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#08c', endColorstr='#0044cc', GradientType=0);
            border-color: #0044cc #0044cc #002a80;
            border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
            filter: progid:DXImageTransform.Microsoft.gradient(enabled=false);
            color: #fff;
            text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.25);
            {rdelim}

            .datepicker table tr td span.active:hover,
            .datepicker table tr td span.active:hover:hover,
            .datepicker table tr td span.active.disabled:hover,
            .datepicker table tr td span.active.disabled:hover:hover,
            .datepicker table tr td span.active:active,
            .datepicker table tr td span.active:hover:active,
            .datepicker table tr td span.active.disabled:active,
            .datepicker table tr td span.active.disabled:hover:active,
            .datepicker table tr td span.active.active,
            .datepicker table tr td span.active:hover.active,
            .datepicker table tr td span.active.disabled.active,
            .datepicker table tr td span.active.disabled:hover.active,
            .datepicker table tr td span.active.disabled,
            .datepicker table tr td span.active:hover.disabled,
            .datepicker table tr td span.active.disabled.disabled,
            .datepicker table tr td span.active.disabled:hover.disabled,
            .datepicker table tr td span.active[disabled],
            .datepicker table tr td span.active:hover[disabled],
            .datepicker table tr td span.active.disabled[disabled],
            .datepicker table tr td span.active.disabled:hover[disabled] {ldelim}
            background-color: #0044cc;
            {rdelim}

            .datepicker table tr td span.active:active,
            .datepicker table tr td span.active:hover:active,
            .datepicker table tr td span.active.disabled:active,
            .datepicker table tr td span.active.disabled:hover:active,
            .datepicker table tr td span.active.active,
            .datepicker table tr td span.active:hover.active,
            .datepicker table tr td span.active.disabled.active,
            .datepicker table tr td span.active.disabled:hover.active {ldelim}
            background-color: #003399 \9;
            {rdelim}

            .datepicker table tr td span.old,
            .datepicker table tr td span.new {ldelim}
            color: #999;
            {rdelim}

            .datepicker .datepicker-switch {ldelim}
            width: 145px;
            {rdelim}

            .datepicker .datepicker-switch,
            .datepicker .prev,
            .datepicker .next,
            .datepicker tfoot tr th {ldelim}
            cursor: pointer;
            {rdelim}

            .datepicker .datepicker-switch:hover,
            .datepicker .prev:hover,
            .datepicker .next:hover,
            .datepicker tfoot tr th:hover {ldelim}
            background: #eee;
            {rdelim}

            .datepicker .prev.disabled,
            .datepicker .next.disabled {ldelim}
            visibility: hidden;
            {rdelim}

            .datepicker .cw {ldelim}
            font-size: 10px;
            width: 12px;
            padding: 0 2px 0 5px;
            vertical-align: middle;
            {rdelim}

            .input-append.date .add-on,
            .input-prepend.date .add-on {ldelim}
            cursor: pointer;
            {rdelim}

            .input-append.date .add-on i,
            .input-prepend.date .add-on i {ldelim}
            margin-top: 3px;
            {rdelim}

            .input-daterange input {
                text-align: center;
                {rdelim}

                .input-daterange input:first-child {ldelim}
                -webkit-border-radius: 3px 0 0 3px;
                -moz-border-radius: 3px 0 0 3px;
                border-radius: 3px 0 0 3px;
                {rdelim}

                .input-daterange input:last-child {ldelim}
                -webkit-border-radius: 0 3px 3px 0;
                -moz-border-radius: 0 3px 3px 0;
                border-radius: 0 3px 3px 0;
                {rdelim}

                .input-daterange .add-on {ldelim}
                display: inline-block;
                width: auto;
                min-width: 16px;
                height: 18px;
                padding: 4px 5px;
                font-weight: normal;
                line-height: 18px;
                text-align: center;
                text-shadow: 0 1px 0 #fff;
                vertical-align: middle;
                background-color: #eee;
                border: 1px solid #ccc;
                margin-left: -5px;
                margin-right: -5px;
                {rdelim}

                .ui-timepicker-div .ui-widget-header {ldelim}
                margin-bottom: 8px;
                {rdelim}

                .ui-timepicker-div dl {ldelim}
                text-align: left;
                {rdelim}

                .ui-timepicker-div dl dt {ldelim}
                float: left;
                clear: left;
                padding: 0 0 0 5px;
                {rdelim}

                .ui-timepicker-div dl dd {ldelim}
                margin: 0 10px 10px 40%;
                {rdelim}

                .ui-timepicker-div td {ldelim}
                font-size: 90%;
                {rdelim}

                .ui-tpicker-grid-label {ldelim}
                background: none;
                border: none;
                margin: 0;
                padding: 0;
                {rdelim}

                .ui-timepicker-div .ui_tpicker_unit_hide {ldelim}
                display: none;
                {rdelim}

                .ui-timepicker-div .ui_tpicker_time .ui_tpicker_time_input {ldelim}
                background: none;
                color: inherit;
                border: none;
                outline: none;
                border-bottom: solid 1px #555;
                width: 95%;
                {rdelim}

                .ui-timepicker-div .ui_tpicker_time .ui_tpicker_time_input:focus {ldelim}
                border-bottom-color: #aaa;
                {rdelim}

                .ui-timepicker-rtl {ldelim}
                direction: rtl;
                {rdelim}

                .ui-timepicker-rtl dl {ldelim}
                text-align: right;
                padding: 0 5px 0 0;
                {rdelim}

                .ui-timepicker-rtl dl dt {ldelim}
                float: right;
                clear: right;
                {rdelim}

                .ui-timepicker-rtl dl dd {ldelim}
                margin: 0 40% 10px 10px;
                {rdelim}

                /* Shortened version style */
                .ui-timepicker-div.ui-timepicker-oneLine {ldelim}
                padding-right: 2px;
                {rdelim}

                .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_time,
                .ui-timepicker-div.ui-timepicker-oneLine dt {ldelim}
                display: none;
                {rdelim}

                .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_time_label {ldelim}
                display: block;
                padding-top: 2px;
                {rdelim}

                .ui-timepicker-div.ui-timepicker-oneLine dl {ldelim}
                text-align: right;
                {rdelim}

                .ui-timepicker-div.ui-timepicker-oneLine dl dd,
                .ui-timepicker-div.ui-timepicker-oneLine dl dd>div {ldelim}
                display: inline-block;
                margin: 0;
                {rdelim}

                .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_minute:before,
                .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_second:before {ldelim}
                content: ':';
                display: inline-block;
                {rdelim}

                .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_millisec:before,
                .ui-timepicker-div.ui-timepicker-oneLine dl dd.ui_tpicker_microsec:before {ldelim}
                content: '.';
                display: inline-block;
                {rdelim}

                .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_unit_hide,
                .ui-timepicker-div.ui-timepicker-oneLine .ui_tpicker_unit_hide:before {ldelim}
                display: none;
                {rdelim}

                /*# sourceMappingURL=bootstrap-datepicker.css.map */

                /* ================================ start licenses */
                .tecSee-overlay-licenses {ldelim}
                position: fixed;
                height: 100vh;
                width: 100vw;
                background: rgba(255, 255, 255, 0.7);
                top: 0;
                left: 0;
                z-index: 1030;
                display: flex;
                justify-content: center;
                align-items: center;
                {rdelim}

                .tecSee-licenses-container {ldelim}
                width: 500px;
                background-color: rgba(11, 11, 11, 0.4);
                border-radius: 10px;
                color: white;
                {rdelim}

                .tecSee-licenses-container .content {ldelim}
                width: 80%;
                margin: auto;
                margin-top: 10px;
                {rdelim}

                {* ========================================== data picker *}

                {* ========================================== data picker *}
                .button-Parent-container {ldelim}
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: 6px;
                margin-bottom: 10px;
                {rdelim}

                .button-Parent-container button {ldelim}
                font-weight: bold;
                width: 70px;
                color: #fff;
                background-color: #5cbcf6;
                border-color: #5cbcf6;
                padding: 5px 0;
                {rdelim}

                .c-select {ldelim}
                width: 100%;
                {rdelim}

                {ldelim}
                .errors {
                    color: red;
                    text-align: start;
                }=
                {rdelim}

                {ldelim}
                .modal-dialog top: 30%;
                {rdelim}
</style>