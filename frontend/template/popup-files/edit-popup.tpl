{block name='method-popup'}
    <div class="pop-up-container popup-confirm-container" id='edit-popup-container'>
        <div class="pop-up-content-parent" id="edit-popup">
            <div class="pop-up-content popup-confirm-content" id="edit-popup-content">
                <i class='dismiss-popup x-icon fa fa-times' id='close-edit-popup'></i>


                <img src='{$ShopURL}/mediafiles/Resources/alerts/clock.svg' id="edit-popup-image" class='pop-up-icon'
                    style="width: 95px;">

                <div class="appointment-edit" id="appointment-edit">
                    <label class="time-label" for="edit-time" id="edit-label">
                        {if $smarty.session.kSprache === 1}
                            Wählen Sie die Zeit zwischen Ihren Terminen
                        {else}
                            Select Your Appointments Time Between
                        {/if}
                        <span></span>
                    </label>
                    <input type="text" class="form-control timepicker hasWickedpicker" id="edit-time"
                        name="reservation-time" onkeypress="return false;" aria-showingpicker="true" tabindex="-1"
                        title="{if $smarty.session.kSprache === 1}Uhrensymbol anklicken{else}click clock icon{/if}">
                </div>

                <p id="edit-error-message"></p>

                <button id="edit-appointment" class="customer-popup-button">
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