{block name='method-popup'}
    <div class="pop-up-container popup-confirm-container" id='appointment-confirmation-popup-container'>
        <div class="pop-up-content-parent" id="appointment-confirmation-popup">
            <div class="pop-up-content popup-confirm-content" id="appointment-confirmation-popup-content">
                <i class='dismiss-popup x-icon fa fa-times' id='close-appointment-confirmation-popup'></i>


                <img src='{$ShopURL}/mediafiles/Resources/alerts/question.svg' id="appointment-confirmation-popup-image"
                    class='pop-up-icon' style="width: 95px;">

                <div class="appointment-description">
                    <h2>
                        {if $smarty.session.kSprache === 1}
                            Info-Meldung
                        {else}
                            Info Message
                        {/if}
                    </h2>
                    <p>
                        {if $smarty.session.kSprache === 1}
                            Sind Sie sicher, dass Sie diesen Termin reservieren möchten?
                            Falls Sie stornieren müssen
                            können Sie den Termin auf meiner Terminseite stornieren
                        {else}
                            are you sure you want to reserve this time<br>
                            in case of you need to cancel
                            you can cancel it from my appointments page
                        {/if}
                    </p>
                </div>

                <p id="request-message"></p>

                <button id="submit-appointment-request" class="customer-popup-button">
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