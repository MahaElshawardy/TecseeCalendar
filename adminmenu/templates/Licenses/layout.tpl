{if $licensesFile eq false}
    {include file="./licenses.tpl"}
{/if}
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.27.2/axios.min.js" integrity="sha512-odNmoc1XJy5x1TMVMdC7EMs3IVdItLPlCeL5vSUPN2llYKMJ2eByTTAIiiuqLg+GdNr9hF6z81p27DArRFKT7A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
{* <script src="{$pluginPath}js/constants.js"></script> *}
<script src="{$pluginPath}js/Licenses/index.js" type="text/javascript"></script>