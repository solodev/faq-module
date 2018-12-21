# faq-module

## Prerequisites
<ul>
	<li><a target="_blank" href="https://getbootstrap.com/">Boostrap4</a></li>
	<li><a target="_blank" href="https://fontawesome.com/">FontAwesome5</a></li>
</ul>

## Step 1: Add the Form
 - faq-form.tpl

Create a calendar for the Events and upload the following form 

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
<?php
      if(isset($dataVars['calendar_entry_id'])){     
        $calendar_entry = new Calendar_Entry($dataVars['calendar_entry_id']);
        if($calendar_entry->path) { 
    ?>
<div class="panel-group">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" href="#collapseURL">Post URL <span class="toggle" aria-hidden="true"></span></a>
            </h4>
        </div>
        <div id="collapseURL" class="panel-collapse collapse in">
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-12">
                        <p class="subText">You can access this blog post at the following URL:</p>
                        <a href="https://www.100k-theme.com<?= $calendar_entry->path ?>" target="_blank">https://www.100k-theme.com<?= $calendar_entry->path ?></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php 
        } 
      }
     ?>

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
 - careers-repeater.tpl

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

## Step 3: Add the Detail Template
 - careers-detail.tpl

```
[entry]
<div class="row">
  <div class="col-sm-8">
    <p class="text-primary"><strong>[print_date format="F d, Y g:i a" timestamp="{{start_time}}"] - [print_date format="F d, Y g:i a" timestamp="{{end_time}}"]</strong></p>
  </div>
</div>
<div class="row my-4">
  <div class="col-md-6 col-lg-8">
    <div class="card rounded-0">
      <div class="card-title border-bottom">
        <h3 class="h4 text-secondary bg-light-gray p-3 mb-0">About This Event</h3>
      </div>
      <div class="card-body">
        {{post_content}}
      </div>
    </div>
  </div>
  <div class="col-md-6 col-lg-4 mt-4 mt-md-0">
    <div class="card rounded-0">
      <div class="card-title border-bottom">
        <h3 class="h4 text-secondary bg-light-gray p-3 mb-0">When &amp; Where</h3>
      </div>
      <div class="card-body">
        <iframe src="https://maps.google.com/maps?f=q&source=s_q&hl=en&geocode=&q={{event_address}}%2C+{{event_city}}%2C+{{event_state}}+{{event_zip}}&ie=UTF8&z=12&t=m&iwloc=near&output=embed" frameborder="0" width="100%" height="200" allowfullscreen></iframe>
        <p class="mt-3">{{event_address}} <br>{{event_city}}, {{event_state}} {{event_zip}}</p>
        <p>[print_date format="F d, Y g:i a" timestamp="{{start_time}}"] -<br /> [print_date format="F d, Y g:i a" timestamp="{{end_time}}"]</p>
        <div class="mt-4">
          <a class="h5 btn btn-primary p-2 px-3 mb-2 text-left" href='https://calendar.google.com/calendar/r/eventedit?text={{event_title}}&dates=[print_date format="Ymd" timestamp="{{start_time}}"]T[print_date format="His" timestamp="{{start_time}}"]/[print_date format="Ymd" timestamp="{{end_time}}"]T[print_date format="His" timestamp="{{end_time}}"]&details={{post_intro}}&location={{event_address}} {{event_city}}, {{event_state}} {{event_zip}}' target="_blank">
            <i class="fas fa-calendar-alt fa-lg pr-2"></i> Add to Google Calendar
          </a>
        </div>
      </div>
    </div>
    <div class="card mt-4 rounded-0">
      <div class="card-title border-bottom">
        <h2 class="h4 text-secondary bg-light-gray p-3 mb-0">Contact Information</h2>
      </div>
      <div class="card-body">
        <p>Email: <a href="mailto:info@email.com">info@email.com</a></p>
      </div>
    </div>
  </div>
</div>
[/entry]
```

## Step 4: Add the JavaScript
 - /_/js/events.js
 
 ```
  $('#accordion').accordion();
 
 ```


## Step 5: Add the SCSS/CSS
 - /_/js/events.js
 
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
