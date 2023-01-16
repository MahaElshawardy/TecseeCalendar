<script src="{$pluginPath}js/Add_gift/timepickerAddon.js" type="text/javascript"></script>

{$jtl_token}
{block name="new-system"}
    {include file="../layout/tecsee_styles.tpl"}
    {include file="../Licenses/layout.tpl"}
    <div class="alert alert-danger" id="error-message-system"></div>
    <div class="card-single">
        <div class="card-header">
            <span class="subheading1">Make new Event</span>
            <hr class="mb-n3" />
        </div>
        <div class="card-body p-0">
            <form id="event" autocomplete="off">
                <div class="container">
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-10 text-start col-form-label  order-1">
                                    Title
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input type="text" class="c-select data" name="title[en]" id="titleEN"
                                        placeholder="Write your title" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    Titel
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input type="text" class="c-select data" name="title[de]" id="titleDE"
                                        placeholder="Schreiben sie den titel" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    Description
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="descriptionEN" class="c-select data" name="description[en]"
                                        placeholder="Write the description" rows="4" cols="50" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    Beschreibung
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="descriptionDE" class="c-select data" name="description[de]"
                                        placeholder="Schreiben sie den Beschreibung" rows="4" cols="50" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    Event Image
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <div class="form-group">
                                        <label for="fileField" class="attachment">
                                            <div class="row btn-file">
                                                <div class="btn-file__preview"></div>
                                                <div class="btn-file__actions w-100">
                                                    <div class="btn-file__actions__item col-xs-12 text-center"
                                                        style="padding: 50px;">
                                                        <div class="btn-file__actions__item--shadow">
                                                            <i class="fa fa-plus fa-lg fa-fw" aria-hidden="true"></i>
                                                            <div class="visible-xs-block"></div>
                                                            Select file
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <input name="file" accept="image/png, image/gif, image/jpeg" value=""
                                                type="file" id="fileField" required>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="errors errors-supplier">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    Location
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input type="text" class="c-select data" name="location[en]" id="locationEN"
                                        placeholder="Write the location" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    Standort
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input type="text" class="c-select data" name="location[de]" id="locationDE"
                                        placeholder="Schreiben Sie den Ort" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label for="event-start-date" class="col col-12 col-form-label  order-1">
                                    Start At
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input id="event-start-date" type='text' class="form-control timepicker"
                                        class="c-select data" placeholder="event Start Date" required />
                                </div>
                            </div>
                            <div id="checkdate" class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label for="event-end-date" class="col col-12 col-form-label  order-1">
                                    End At
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input id="event-end-date" type='text' class="form-control timepicker"
                                        class="c-select data" placeholder="event End Date" required />
                                </div>
                            </div>
                            <div id="checkdate" class="errors errors-supplier">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    facebook
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input type="url" class="c-select data" pattern="https://.*" title="type a valid link"
                                        name="facebook_url" id="facebook" placeholder="Write facebook link" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-12 col-form-label  order-1">
                                    twitter
                                </label>
                                <div class="col-sm-12 col-lg-10  pr-sm-5 order-last order-sm-2 w-100">
                                    <input type="url" class="c-select data" pattern="https://.*" title="type a valid link"
                                        name="twitter_url" id="twitter" placeholder="Write twitter link" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="full-width">
                    <button type="submit" style="float: right;" class="btn btn-primary btn-block w-fit mr-4">
                        <i class="fal fa-save"></i>
                        Save
                    </button>
                    <div class="clear"></div>
                </div>
            </form>
        </div>
    </div>

    <button type="button" hidden class="btn btn-info btn-lg" id="statusmodal" data-toggle="modal"
        data-target="#eventstatussmodal"></button>

    <div class="modal fade" id="eventstatussmodal" role="dialog" style="min-width: 50%;width: fit-content;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <i id="close-updated-modal" class="fas fa-xmark close" data-dismiss="modal">X</i>
                    <h4>Modal Title</h4>
                </div>
                <div id="modalstatus" class="modal-body ">

                </div>
            </div>
        </div>
    </div>


    <style>
        #error-message-system,
        #discount-column {
            display: none;
        }

        #loading {
            position: fixed;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background-color: rgba(255, 255, 255, 1);
            z-index: 20000;
            display: none;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        #gift input:not(input.form-control.data),
        #gift select {
            width: 100%;
        }
    </style>
{/block}

</style>
<div id="loading">
    <div>
        <img src="https://mir-s3-cdn-cf.behance.net/project_modules/disp/585d0331234507.564a1d239ac5e.gif" />
    </div>
    {if $smarty.session.kSprache === 1}
        <p>Loading . . . </p>
    {/if}
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.min.js"
    integrity="sha512-odNmoc1XJy5x1TMVMdC7EMs3IVdItLPlCeL5vSUPN2llYKMJ2eByTTAIiiuqLg+GdNr9hF6z81p27DArRFKT7A=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="{$pluginPath}js/constants.js"></script>
<script src="{$pluginPath}js/Add_gift/index.js"></script>