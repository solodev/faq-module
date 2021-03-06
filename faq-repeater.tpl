
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