{block name='operation-popup'}
    <div class="pop-up-container popup-confirm-container" id='appointments-operations-container'>
        <div class="pop-up-content-parent" id="pop-up-content-appointments-operations">
            <div class="pop-up-content popup-confirm-content" id="popup-appointments-operations">
                <i class='dismiss-popup x-icon fa fa-times' id='close-popup-appointments-operations'></i>


                <img src='{$ShopURL}/mediafiles/Resources/alerts/question.svg' id="image-for-appointments-operations"
                    class='pop-up-icon' style="width: 95px;">

                <p class="customer-popup-message" id="customer-popup-message">
                    {if $smarty.session.kSprache === 1}
                        Sind Sie sicher, dass Sie diese Operation durchführen wollen?
                    {else}
                        are you sure that you want to do this operation
                    {/if}
                </p>

                <button class="customer-popup-button" id="customer-popup-button">
                    {if $smarty.session.kSprache === 1}
                        Einreichen
                    {else}
                        Submit
                    {/if}
                </button>
            </div>
        </div>
    </div>
{/block}