<body>
{include file='../total/header.tpl'}
<div class="container">
    {include file='../total/navigate.tpl'}

   {if isset($responseData)}
       {foreach from = $responseData key=$key item=$response name=response}
           <div class="card" style="float: left; display: block;
        max-width: 18rem; margin-top: 10px; margin-left: 10px; text-align: center;">
               <div class="card-body">
                   <h6 class="card-subtitle mb-2 text-muted">ID : {$response['id']}</h6>
                   <h5 class="card-title"><span class="text-muted">Title</span> : {$response['title']}</h5>
                   <h6 class="card-subtitle mb-2 text-muted">Subtitle : {$response['subtitle']}</h6>
                   <h6 class="card-subtitle mb-2 text-muted">Content : {$response['content']}</h6>
               </div>
           </div>
           {if $smarty.foreach.response.iteration mod 3 == 0}
               <div style="clear: both;"></div>
           {/if}
       {/foreach}
   {else}
       <div class="card-body">
           <div>Hello, string search is empty!</div>
       </div>
   {/if}

    {include file='../total/footer.tpl'}
</div>
</body>
</html>