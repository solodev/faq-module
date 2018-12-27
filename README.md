# faq-module

## Prerequisites
<ul>
	<li><a target="_blank" href="https://getbootstrap.com/">Boostrap4</a></li>
	<li><a target="_blank" href="https://fontawesome.com/">FontAwesome5</a></li>
</ul>

## Step 1: Add the Form
 - faq-form.tpl

Create a calendar for the FAQ and upload the following form 

```
<div class="panel-group">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseStatus" aria-expanded="true">Post Status<span class="toggle"aria-hidden="true"></span></a>
            </h4>
        </div>
        <div id="collapseStatus" class="panel-collapse collapse in">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-3">
                        <h2><label class="label-control" for="post_status">Post Status</label></h2>
                        <select class="form-control" type="text" name="post_status">
                            <option value="Draft">Draft</option>
                            <option value="Published">Published</option>
                        </select>
                    </div>
                   
                </div>
            </div>
        </div>
    </div>
</div>


<div class="panel-group">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseResourceContent" aria-expanded="true">FAQs <span class="toggle" aria-hidden="true"></span></a>
            </h4>
        </div>
        <div id="collapseResourceContent" class="panel-collapse collapse in">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <h2><label class="label-control" for="heading_title">FAQ Question</label></h2>
                        <p class="subText">(Required)</p>
                        <input type="text" class="form-control" name="heading_title" id="heading_title">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2><label class="label-control" for="faq_answer">FAQ Answer</label></h2>
                        <p class="subText">(Required)</p>
                        <textarea class="form-control wysiwyg2" name="faq_answer" id="faq_answer"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="panel-group">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseMeta">META Data <span class="toggle" aria-hidden="true"></span></a>
            </h4>
        </div>
        <div id="collapseMeta" class="panel-collapse collapse">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <h2><label name="meta_title">Meta Title</label></h2>
                        <p class="subText">(Optional) Include a custom META Title that will show in your browser tab and in the page's source code.</p>
                        <input type="text" class="form-control" name="meta_title" id="meta_title">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2><label name="meta_description">Meta Description</label></h2>
                        <p class="subText">(Optional) Include a custom META Description that search engines will index. 50-160 Characters</p>
                        <textarea class="form-control" id="meta_description" name="meta_description"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <h2><label name="meta_keywords">Meta Keywords</label></h2>
                        <p class="subText">(Optional) Include the main keywords of the blog article.</p>
                        <textarea class="form-control" id="meta_keywords" name="meta_keywords"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="panel-group">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseAdvanced">Advanced <span class="toggle" aria-hidden="true"></span></a>
            </h4>
        </div>
        <div id="collapseAdvanced" class="panel-collapse collapse">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <h2><label class="label-control" for="post_javascript">Custom JavaScript</label></h2>
                        <p class="subText">(Optional) Use the following textbox to embed any custom JavaScript including tracking pixels and Google Analytics scripts. Be sure to open your JavaScript with a &lt;script&gt; tag and close everything with a &lt;/script&gt; tag.</p>
                        <textarea class="form-control" name="post_javascript" id="post_javascript"></textarea>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    $('.wysiwyg').ckeditor(function () {}, {
        customConfig: '/CK/config.js',
        height: '600px',
        basePath: '/CK/',
        toolbar: 'WP'
    });
</script>

```

## Step 2: Add the Repeater
 - faq-repeater.tpl

Add the following repeater shortcode. 

```

<section id="accordion">
[repeater id='5' pages="22" order="start_time desc" display_type="news" where="post_status='Published'"]
    <a class="py-3 d-block h-100 w-100 position-relative z-index-1 pr-3 text-secondary  border-top" aria-controls="faq-{{calendar_entry_id}}" aria-expanded="false" data-toggle="collapse" href="#faq-{{calendar_entry_id}}" role="button">
  <div class="position-relative">
  [cond type="is" subject="{{index}}" value="0"]
    <h2 class="h4 m-0">
  [/cond]
  [cond type="is_not" subject="{{index}}" value="0"]
    <h2 class="h4 m-0">
  [/cond]

      [is_set value="{{heading_title}}"]
        {{heading_title}}
      [/is_set]
      [is_empty value="{{heading_title}}"]
        {{event_title}}
      [/is_empty]

    </h2>
    <div class="position-absolute top-0 right-0 h-100 d-flex align-items-center"><i class="fas fa-plus"></i></div>
  </div>
  </a>
  <div class="collapse" id="faq-{{calendar_entry_id}}">
    <div class="card card-body border-0 p-0">
      <p>{{faq_answer}}<p>
    </div>
  </div>

  [/repeater]
</section>
[/repeater]

```

## Step 4: Add the JavaScript
 - /_/js/faq.js
 
 ```
  $('#accordion').accordion();
 
 ```


## Step 5: Add the SCSS/CSS
 - /_/scss/faq.scss
 
 ```
  .top-0 {
      top: 0;
  }
  .right-0 {
      right: 0;
  }
  .z-index-1 {
      z-index: 1;
  } 
  
 ```
