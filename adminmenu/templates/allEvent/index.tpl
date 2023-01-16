{$jtl_token}
{block name="new-system"}
    {include file="../layout/tecsee_styles.tpl"}
    <div class="alert alert-danger" id="error-message-system"></div>
    <div class="card-single">
        <div class="card-header">
            <span class="subheading1">Detail Event</span>
            <hr class="mb-n3" />
        </div>

        <div class="card-body p-0">
            <div class="tecSee-table-parent">
                <div class="tecSee-table-container">
                    <div class="tecSee-remove-padding mb-3">
                        <div class="button-Parent-container">
                            <button id="prev-logs-page">
                                {if $smarty.session.kSprache === 1}
                                    Prev
                                {else}
                                    Prev
                                {/if}
                            </button>
                            <button id="next-logs-page">
                                {if $smarty.session.kSprache === 1}
                                    Weiter
                                {else}
                                    Next
                                {/if}
                            </button>
                        </div>

                        <table class="table table-striped table-align-top tecSee-table">
                            <thead>
                                <tr>
                                    <th class="text-center">title</th>
                                    <th class="text-center">Titel</th>
                                    <th class="text-center">Description</th>
                                    <th class="text-center">Beschreibung</th>
                                    <th class="text-center">Location</th>
                                    <th class="text-center">Standort</th>
                                    <th class="text-center">Image</th>
                                    <th class="text-center">Start At</th>
                                    <th class="text-center">End At</th>
                                    <th class="text-center">Facebook</th>
                                    <th class="text-center">Twitter</th>
                                    <th class="text-center">Status</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody id="all-logs-data">
                                {if $events|@count > 0}
                                    {foreach $events as $event}
                                        <tr class="text-center">
                                            <td><b>{$event->title_en}</td>
                                            <td><b>{$event->title_de}</td>
                                            <td><b>{$event->description_en}</td>
                                            <td><b>{$event->description_de}</td>
                                            <td><b>{$event->location_en}</td>
                                            <td><b>{$event->location_de}</td>
                                            <td><img src="/mediafiles/events/{$event->image}" alt="picture" width="100px"
                                                    height="100px"></td>
                                            <td><b>{$event->start_time}</td>
                                            <td><b>{$event->end_time}</td>
                                            <td><b><a href="{$event->facebook_url}">Click Here</a></td>
                                            <td><b><a href="{$event->twitter_url}">Click Here</td>
                                            <td><b>
                                                    {if $event->status === 'started'}
                                                        <select class="form-select" id="updatestatus" statusid="{$event->id}"
                                                            aria-label="Default select example">
                                                            <option selected>{$event->status}</option>
                                                            <option value="cancel">Cancel</option>
                                                            <option value="finished">Finish</option>
                                                        </select>
                                                    {elseif $event->status === 'waiting'}
                                                        <select class="form-select" id="updatestatus" statusid="{$event->id}"
                                                            aria-label="Default select example">
                                                            <option selected>{$event->status}</option>
                                                            <option value="cancel">Cancel</option>
                                                            <option value="finished">Finish</option>
                                                            <option value="started">Start</option>
                                                        </select>
                                                    {else}
                                                        <h4>{$event->status}</h4>
                                                    {/if}
                                            </td>
                                            <td>
                                                <button data-calender='{$event->id}' onclick='deleteDescription({$event->id});'
                                                    class="btn btn-danger btn-inline-block mx-auto w-fit DeleteCalender">
                                                    <i class="fas fa-trash-alt"></i>
                                                </button>

                                                <button data-calender='{$event->id}' onclick='openUpdateModel({$event});'
                                                    class="btn btn-primary btn-inline-block mx-auto w-fit update-calender">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                            </td>
                                        </tr>
                                    {/foreach}
                                {else}
                                    <tr>
                                        <td class='text-center' id='npApiMessage' colspan="13">there is no data here</td>
                                    </tr>
                                {/if}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <button type="button" hidden class="btn btn-info btn-lg" id="imageeditmodal" data-toggle="modal"
        data-target="#carEditModal"></button>

    <!--  Edit modal -->
    <div class="modal fade" id="carEditModal" role="dialog" style="min-width: 50%;width: fit-content;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <i id="close-updated-modal" class="fas fa-xmark close" data-dismiss="modal">X</i>
                    <h4>Edit</h4>
                </div>
                <div class="modal-body">
                    <form id="update-calender-details" autocomplete="off">
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Title
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-title" name="promotion-title" value='' type="text"
                                        class="c-select data w-100" placeholder="Title" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Titel
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-title-du" name="promotion-titel-Du" value='' type="text"
                                        class="c-select data w-100" placeholder="Titel" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Description
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-Description" name="promotion-Description" value='' type="text"
                                        class="c-select data w-100" placeholder="Description" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Beschreibung
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-Description-du" name="promotion-details-Du" value='' type="text"
                                        class="c-select data w-100" placeholder="Beschreibung" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Location
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-Location" name="promotion-Location" value='' type="text"
                                        class="c-select data w-100" placeholder="Location" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Standort
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-Location-du" name="promotion-Location-du" value='' type="text"
                                        class="c-select data w-100" placeholder="Standort" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Promotion Image
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <div class="form-group">
                                        <label for="update-fileField" class="attachment">
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
                                            <input name="file" type="file" id="update-fileField">
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Start At
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <input id="update-start-date" type='text' class="form-control timepicker"
                                        class="c-select data w-100" placeholder="event Start Date" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    End At
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <input id="update-end-date" type='text' class="form-control timepicker"
                                        class="c-select data w-100" placeholder="event End Date" required />
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Facebook
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-Facebook" name="promotion-Facebook" value='' type="text"
                                        class="c-select data w-100" placeholder="Facebook" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
                            </div>
                        </div>
                        <div class="dflex-column">
                            <div class="form-group form-row align-items-center">
                                <label class="col col-sm-4 col-form-label text-sm-right order-1">
                                    Twitter
                                </label>
                                <div class="col-sm pl-sm-3 pr-sm-5 order-last order-sm-2 w-100">
                                    <textarea id="update-Twitter" name="promotion-Twitter" value='' type="text"
                                        class="c-select data w-100" placeholder="Twitter" required></textarea>
                                </div>
                            </div>
                            <div class="errors errors-supplier">
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
        </div>
    </div>


    <button type="button" hidden class="btn btn-info btn-lg" id="editmodal" data-toggle="modal"
        data-target="#editstatussmodal"></button>

    <div class="modal fade" id="editstatussmodal" role="dialog" style="min-width: 50%;width: fit-content;">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <i id="close-updated-modal" class="fas fa-xmark close" data-dismiss="modal">X</i>
                    <h4>Modal Title</h4>
                </div>
                <div id="editmodalstatus" class="modal-body ">

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

        #gift-details input:not(input.form-control.data),
        #gift-details select {
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

<script>
    jQuery(($) => {
        $('.attachment input[type="file"]')
            .on('change', (event) => {
                let el = $(event.target).closest('.attachment').find('.btn-file');

                el
                    .find('.btn-file__actions__item')
                    .css({
                        'padding': '135px 277px'
                    });

                el
                    .find('.btn-file__preview')
                    .css({
                        'background-image': 'url(' + window.URL.createObjectURL(event.target.files[0]) +
                            ')'
                    });
            });
    });
</script>

<script src="{$pluginPath}js/all_event/index.js"></script>
<script src="{$pluginPath}js/bootstrap.js"></script>