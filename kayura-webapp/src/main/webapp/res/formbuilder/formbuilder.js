(function() {
  rivets.binders.input = {
    publishes: true,
    routine: rivets.binders.value.routine,
    bind: function(el) {
      return $(el).bind('input.rivets', this.publish);
    },
    unbind: function(el) {
      return $(el).unbind('input.rivets');
    }
  };

  rivets.configure({
    prefix: "rv",
    adapter: {
      subscribe: function(obj, keypath, callback) {
        callback.wrapped = function(m, v) {
          return callback(v);
        };
        return obj.on('change:' + keypath, callback.wrapped);
      },
      unsubscribe: function(obj, keypath, callback) {
        return obj.off('change:' + keypath, callback.wrapped);
      },
      read: function(obj, keypath) {
        if (keypath === "cid") {
          return obj.cid;
        }
        return obj.get(keypath);
      },
      publish: function(obj, keypath, value) {
        if (obj.cid) {
          return obj.set(keypath, value);
        } else {
          return obj[keypath] = value;
        }
      }
    }
  });

}).call(this);

(function() {
  var BuilderView, EditFieldView, Formbuilder, FormbuilderCollection, FormbuilderModel, ViewFieldView, _ref, _ref1, _ref2, _ref3, _ref4,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  FormbuilderModel = (function(_super) {
    __extends(FormbuilderModel, _super);

    function FormbuilderModel() {
      _ref = FormbuilderModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    FormbuilderModel.prototype.sync = function() {};

    FormbuilderModel.prototype.indexInDOM = function() {
      var $wrapper,
        _this = this;
      $wrapper = $(".fb-field-wrapper").filter((function(_, el) {
        return $(el).data('cid') === _this.cid;
      }));
      return $(".fb-field-wrapper").index($wrapper);
    };

    FormbuilderModel.prototype.is_input = function() {
      return Formbuilder.inputFields[this.get(Formbuilder.options.mappings.FIELD_TYPE)] != null;
    };

    return FormbuilderModel;

  })(Backbone.DeepModel);

  FormbuilderCollection = (function(_super) {
    __extends(FormbuilderCollection, _super);

    function FormbuilderCollection() {
      _ref1 = FormbuilderCollection.__super__.constructor.apply(this, arguments);
      return _ref1;
    }

    FormbuilderCollection.prototype.initialize = function() {
      return this.on('add', this.copyCidToModel);
    };

    FormbuilderCollection.prototype.model = FormbuilderModel;

    FormbuilderCollection.prototype.comparator = function(model) {
      return model.indexInDOM();
    };

    FormbuilderCollection.prototype.copyCidToModel = function(model) {
      return model.attributes.cid = model.cid;
    };

    return FormbuilderCollection;

  })(Backbone.Collection);

  ViewFieldView = (function(_super) {
    __extends(ViewFieldView, _super);

    function ViewFieldView() {
      _ref2 = ViewFieldView.__super__.constructor.apply(this, arguments);
      return _ref2;
    }

    ViewFieldView.prototype.className = "fb-field-wrapper";

    ViewFieldView.prototype.events = {
      'click .subtemplate-wrapper': 'focusEditView',
      'click .js-duplicate': 'duplicate',
      'click .js-clear': 'clear'
    };

    ViewFieldView.prototype.initialize = function(options) {
      this.parentView = options.parentView;
      this.listenTo(this.model, "change", this.render);
      return this.listenTo(this.model, "destroy", this.remove);
    };

    ViewFieldView.prototype.render = function() {
      this.$el.addClass('response-field-' + this.model.get(Formbuilder.options.mappings.FIELD_TYPE)).data('cid', this.model.cid).html(Formbuilder.templates["view/base" + (!this.model.is_input() ? '_non_input' : '')]({
        rf: this.model
      }));
      return this;
    };

    ViewFieldView.prototype.focusEditView = function() {
      return this.parentView.createAndShowEditView(this.model);
    };

    ViewFieldView.prototype.clear = function(e) {
      var cb, x,
        _this = this;
      e.preventDefault();
      e.stopPropagation();
      cb = function() {
        _this.parentView.handleFormUpdate();
        return _this.model.destroy();
      };
      x = Formbuilder.options.CLEAR_FIELD_CONFIRM;
      switch (typeof x) {
        case 'string':
          if (confirm(x)) {
            return cb();
          }
          break;
        case 'function':
          return x(cb);
        default:
          return cb();
      }
    };

    ViewFieldView.prototype.duplicate = function() {
      var attrs;
      attrs = _.clone(this.model.attributes);
      delete attrs['id'];
      attrs['label'] += ' 复制';
      return this.parentView.createField(attrs, {
        position: this.model.indexInDOM() + 1
      });
    };

    return ViewFieldView;

  })(Backbone.View);

  EditFieldView = (function(_super) {
    __extends(EditFieldView, _super);

    function EditFieldView() {
      _ref3 = EditFieldView.__super__.constructor.apply(this, arguments);
      return _ref3;
    }

    EditFieldView.prototype.className = "edit-response-field";

    EditFieldView.prototype.events = {
      'click .js-add-option': 'addOption',
      'click .js-remove-option': 'removeOption',
      'click .js-default-updated': 'defaultUpdated',
      'input .option-label-input': 'forceRender'
    };

    EditFieldView.prototype.initialize = function(options) {
      this.parentView = options.parentView;
      return this.listenTo(this.model, "destroy", this.remove);
    };

    EditFieldView.prototype.render = function() {
      this.$el.html(Formbuilder.templates["edit/base" + (!this.model.is_input() ? '_non_input' : '')]({
        rf: this.model
      }));
      rivets.bind(this.$el, {
        model: this.model
      });
      return this;
    };

    EditFieldView.prototype.remove = function() {
      this.parentView.editView = void 0;
      this.parentView.$el.find("[data-target=\"#addField\"]").click();
      return EditFieldView.__super__.remove.apply(this, arguments);
    };

    EditFieldView.prototype.addOption = function(e) {
      var $el, i, newOption, options;
      $el = $(e.currentTarget);
      i = this.$el.find('.option').index($el.closest('.option'));
      options = this.model.get(Formbuilder.options.mappings.OPTIONS) || [];
      newOption = {
        label: "",
        checked: false
      };
      if (i > -1) {
        options.splice(i + 1, 0, newOption);
      } else {
        options.push(newOption);
      }
      this.model.set(Formbuilder.options.mappings.OPTIONS, options);
      this.model.trigger("change:" + Formbuilder.options.mappings.OPTIONS);
      return this.forceRender();
    };

    EditFieldView.prototype.removeOption = function(e) {
      var $el, index, options;
      $el = $(e.currentTarget);
      index = this.$el.find(".js-remove-option").index($el);
      options = this.model.get(Formbuilder.options.mappings.OPTIONS);
      options.splice(index, 1);
      this.model.set(Formbuilder.options.mappings.OPTIONS, options);
      this.model.trigger("change:" + Formbuilder.options.mappings.OPTIONS);
      return this.forceRender();
    };

    EditFieldView.prototype.defaultUpdated = function(e) {
      var $el;
      $el = $(e.currentTarget);
      if (this.model.get(Formbuilder.options.mappings.FIELD_TYPE) !== 'checkboxes') {
        this.$el.find(".js-default-updated").not($el).attr('checked', false).trigger('change');
      }
      return this.forceRender();
    };

    EditFieldView.prototype.forceRender = function() {
      return this.model.trigger('change');
    };

    return EditFieldView;

  })(Backbone.View);

  BuilderView = (function(_super) {
    __extends(BuilderView, _super);

    function BuilderView() {
      _ref4 = BuilderView.__super__.constructor.apply(this, arguments);
      return _ref4;
    }

    BuilderView.prototype.SUBVIEWS = [];

    BuilderView.prototype.events = {
      'click .js-save-form': 'saveForm',
      'click .fb-tabs a': 'showTab',
      'click .fb-add-field-types a': 'addField',
      'mouseover .fb-add-field-types': 'lockLeftWrapper',
      'mouseout .fb-add-field-types': 'unlockLeftWrapper'
    };

    BuilderView.prototype.initialize = function(options) {
      var selector;
      selector = options.selector, this.formBuilder = options.formBuilder, this.bootstrapData = options.bootstrapData;
      if (selector != null) {
        this.setElement($(selector));
      }
      this.collection = new FormbuilderCollection;
      this.collection.bind('add', this.addOne, this);
      this.collection.bind('reset', this.reset, this);
      this.collection.bind('change', this.handleFormUpdate, this);
      this.collection.bind('destroy add reset', this.hideShowNoResponseFields, this);
      this.collection.bind('destroy', this.ensureEditViewScrolled, this);
      this.render();
      this.collection.reset(this.bootstrapData);
      return this.bindSaveEvent();
    };

    BuilderView.prototype.bindSaveEvent = function() {
      var _this = this;
      this.formSaved = true;
      this.saveFormButton = this.$el.find(".js-save-form");
      this.saveFormButton.attr('disabled', true).text(Formbuilder.options.dict.ALL_CHANGES_SAVED);
      if (!!Formbuilder.options.AUTOSAVE) {
        setInterval(function() {
          return _this.saveForm.call(_this);
        }, 5000);
      }
      return $(window).bind('beforeunload', function() {
        if (_this.formSaved) {
          return void 0;
        } else {
          return Formbuilder.options.dict.UNSAVED_CHANGES;
        }
      });
    };

    BuilderView.prototype.reset = function() {
      this.$responseFields.html('');
      return this.addAll();
    };

    BuilderView.prototype.render = function() {
      var subview, _i, _len, _ref5;
      this.$el.html(Formbuilder.templates['page']());
      this.$fbLeft = this.$el.find('.fb-left');
      this.$fbRight = this.$el.find('.fb-right');
      this.$responseFields = this.$el.find('.fb-response-fields');
      this.bindWindowScrollEvent();
      this.hideShowNoResponseFields();
      _ref5 = this.SUBVIEWS;
      for (_i = 0, _len = _ref5.length; _i < _len; _i++) {
        subview = _ref5[_i];
        new subview({
          parentView: this
        }).render();
      }
      return this;
    };

    BuilderView.prototype.bindWindowScrollEvent = function() {
      var _this = this;
      return $(window).on('scroll', function() {
        var maxMargin, newMargin;
        if (_this.$fbLeft.data('locked') === true) {
          return;
        }
        newMargin = Math.max(0, $(window).scrollTop() - _this.$el.offset().top);
        maxMargin = _this.$responseFields.height();
        _this.$fbRight.css({
          'margin-top': Math.min(maxMargin, newMargin)
        });
        return _this.$fbLeft.css({
          'margin-top': Math.min(maxMargin, newMargin)
        });
      });
    };

    BuilderView.prototype.showTab = function(e) {
      var $el, first_model, target;
      $el = $(e.currentTarget);
      target = $el.data('target');
      $el.closest('li').addClass('active').siblings('li').removeClass('active');
      $(target).addClass('active').siblings('.fb-tab-pane').removeClass('active');
      if (target !== '#editField') {
        this.unlockLeftWrapper();
      }
      if (target === '#editField' && !this.editView && (first_model = this.collection.models[0])) {
        return this.createAndShowEditView(first_model);
      }
    };

    BuilderView.prototype.addOne = function(responseField, _, options) {
      var $replacePosition, view;
      view = new ViewFieldView({
        model: responseField,
        parentView: this
      });
      if (options.$replaceEl != null) {
        return options.$replaceEl.replaceWith(view.render().el);
      } else if ((options.position == null) || options.position === -1) {
        return this.$responseFields.append(view.render().el);
      } else if (options.position === 0) {
        return this.$responseFields.prepend(view.render().el);
      } else if (($replacePosition = this.$responseFields.find(".fb-field-wrapper").eq(options.position))[0]) {
        return $replacePosition.before(view.render().el);
      } else {
        return this.$responseFields.append(view.render().el);
      }
    };

    BuilderView.prototype.setSortable = function() {
      var _this = this;
      if (this.$responseFields.hasClass('ui-sortable')) {
        this.$responseFields.sortable('destroy');
      }
      this.$responseFields.sortable({
        forcePlaceholderSize: true,
        placeholder: 'sortable-placeholder',
        stop: function(e, ui) {
          var rf;
          if (ui.item.data('field-type')) {
            rf = _this.collection.create(Formbuilder.helpers.defaultFieldAttrs(ui.item.data('field-type')), {
              $replaceEl: ui.item
            });
            _this.createAndShowEditView(rf);
          }
          _this.handleFormUpdate();
          return true;
        },
        update: function(e, ui) {
          if (!ui.item.data('field-type')) {
            return _this.ensureEditViewScrolled();
          }
        }
      });
      return this.setDraggable();
    };

    BuilderView.prototype.setDraggable = function() {
      var $addFieldButtons,
        _this = this;
      $addFieldButtons = this.$el.find("[data-field-type]");
      return $addFieldButtons.draggable({
        connectToSortable: this.$responseFields,
        helper: function() {
          var $helper;
          $helper = $("<div class='response-field-draggable-helper' />");
          $helper.css({
            width: _this.$responseFields.width(),
            height: '80px'
          });
          return $helper;
        }
      });
    };

    BuilderView.prototype.addAll = function() {
      this.collection.each(this.addOne, this);
      return this.setSortable();
    };

    BuilderView.prototype.hideShowNoResponseFields = function() {
      return this.$el.find(".fb-no-response-fields")[this.collection.length > 0 ? 'hide' : 'show']();
    };

    BuilderView.prototype.addField = function(e) {
      var field_type;
      field_type = $(e.currentTarget).data('field-type');
      return this.createField(Formbuilder.helpers.defaultFieldAttrs(field_type));
    };

    BuilderView.prototype.createField = function(attrs, options) {
      var rf;
      rf = this.collection.create(attrs, options);
      this.createAndShowEditView(rf);
      return this.handleFormUpdate();
    };

    BuilderView.prototype.createAndShowEditView = function(model) {
      var $newEditEl, $responseFieldEl;
      $responseFieldEl = this.$el.find(".fb-field-wrapper").filter(function() {
        return $(this).data('cid') === model.cid;
      });
      $responseFieldEl.addClass('editing').siblings('.fb-field-wrapper').removeClass('editing');
      if (this.editView) {
        if (this.editView.model.cid === model.cid) {
          this.$el.find(".fb-tabs a[data-target=\"#editField\"]").click();
          this.scrollLeftWrapper($responseFieldEl);
          return;
        }
        this.editView.remove();
      }
      this.editView = new EditFieldView({
        model: model,
        parentView: this
      });
      $newEditEl = this.editView.render().$el;
      this.$el.find(".fb-edit-field-wrapper").html($newEditEl);
      this.$el.find(".fb-tabs a[data-target=\"#editField\"]").click();
      this.scrollLeftWrapper($responseFieldEl);
      return this;
    };

    BuilderView.prototype.ensureEditViewScrolled = function() {
      if (!this.editView) {
        return;
      }
      return this.scrollLeftWrapper($(".fb-field-wrapper.editing"));
    };

    BuilderView.prototype.scrollLeftWrapper = function($responseFieldEl) {
      var _this = this;
      this.unlockLeftWrapper();
      if (!$responseFieldEl[0]) {
        return;
      }
      return $.scrollWindowTo((this.$el.offset().top + $responseFieldEl.offset().top) - this.$responseFields.offset().top, 200, function() {
        return _this.lockLeftWrapper();
      });
    };

    BuilderView.prototype.lockLeftWrapper = function() {
      return this.$fbLeft.data('locked', true);
    };

    BuilderView.prototype.unlockLeftWrapper = function() {
      return this.$fbLeft.data('locked', false);
    };

    BuilderView.prototype.handleFormUpdate = function() {
      if (this.updatingBatch) {
        return;
      }
      this.formSaved = false;
      return this.saveFormButton.removeAttr('disabled').text(Formbuilder.options.dict.SAVE_FORM);
    };

    BuilderView.prototype.saveForm = function(e) {
      var payload;
      if (this.formSaved) {
        return;
      }
      this.formSaved = true;
      this.saveFormButton.attr('disabled', true).text(Formbuilder.options.dict.ALL_CHANGES_SAVED);
      this.collection.sort();
      payload = JSON.stringify(this.collection.toJSON());
      if (Formbuilder.options.HTTP_ENDPOINT) {
        this.doAjaxSave(payload);
      }
      return this.formBuilder.trigger('save', payload);
    };

    BuilderView.prototype.doAjaxSave = function(payload) {
      var _this = this;
      return $.ajax({
        url: Formbuilder.options.HTTP_ENDPOINT,
        type: Formbuilder.options.HTTP_METHOD,
        data: payload,
        contentType: "application/json",
        success: function(data) {
          var datum, _i, _len, _ref5;
          _this.updatingBatch = true;
          for (_i = 0, _len = data.length; _i < _len; _i++) {
            datum = data[_i];
            if ((_ref5 = _this.collection.get(datum.cid)) != null) {
              _ref5.set({
                id: datum.id
              });
            }
            _this.collection.trigger('sync');
          }
          return _this.updatingBatch = void 0;
        }
      });
    };

    return BuilderView;

  })(Backbone.View);

  Formbuilder = (function() {
    Formbuilder.helpers = {
      defaultFieldAttrs: function(field_type) {
        var attrs, _base;
        attrs = {};
        attrs[Formbuilder.options.mappings.LABEL] = '未定义';
        attrs[Formbuilder.options.mappings.FIELD_TYPE] = field_type;
        attrs[Formbuilder.options.mappings.REQUIRED] = false;
        attrs['field_options'] = {};
        return (typeof (_base = Formbuilder.fields[field_type]).defaultAttributes === "function" ? _base.defaultAttributes(attrs) : void 0) || attrs;
      },
      simple_format: function(x) {
        return x != null ? x.replace(/\n/g, '<br />') : void 0;
      }
    };

    Formbuilder.options = {
      BUTTON_CLASS: 'fb-button',
      HTTP_ENDPOINT: '',
      HTTP_METHOD: 'POST',
      AUTOSAVE: false,
      CLEAR_FIELD_CONFIRM: false,
      mappings: {
        SIZE: 'field_options.size',
        UNITS: 'field_options.units',
        NAME: 'name',
        LABEL: 'label',
        PLACEHOLDER: "placeholder",
        DESCRIPTION: 'description',
        FIELD_TYPE: 'field_type',
        REQUIRED: 'required',
        ADMIN_ONLY: 'admin_only',
        OPTIONS: 'field_options.options',
        FORMAT: 'field_options.format',
        ACTIONNAME: 'field_options.action_name',
        STARTLABEL: 'field_options.start_label',
        ENDLABEL: 'field_options.end_label',
        INCLUDE_OTHER: 'field_options.include_other_option',
        INCLUDE_BLANK: 'field_options.include_blank_option',
        INTEGER_ONLY: 'field_options.integer_only',
        MIN: 'field_options.min',
        MAX: 'field_options.max',
        MINLENGTH: 'field_options.minlength',
        MAXLENGTH: 'field_options.maxlength',
        LENGTH_UNITS: 'field_options.length_units'
      },
      dict: {
        ALL_CHANGES_SAVED: '已保存全部修改',
        SAVE_FORM: '保存表单',
        UNSAVED_CHANGES: '你尚有未保存的修改。如果你选择离开，修改将丢失!'
      }
    };

    Formbuilder.fields = {};

    Formbuilder.inputFields = {};

    Formbuilder.nonInputFields = {};

    Formbuilder.registerField = function(name, opts) {
      var x, _i, _len, _ref5;
      _ref5 = ['view', 'edit'];
      for (_i = 0, _len = _ref5.length; _i < _len; _i++) {
        x = _ref5[_i];
        opts[x] = _.template(opts[x]);
      }
      opts.field_type = name;
      Formbuilder.fields[name] = opts;
      if (opts.type === 'non_input') {
        return Formbuilder.nonInputFields[name] = opts;
      } else {
        return Formbuilder.inputFields[name] = opts;
      }
    };

    function Formbuilder(opts) {
      var args;
      if (opts == null) {
        opts = {};
      }
      _.extend(this, Backbone.Events);
      args = _.extend(opts, {
        formBuilder: this
      });
      this.mainView = new BuilderView(args);
    }

    return Formbuilder;

  })();

  window.Formbuilder = Formbuilder;

  if (typeof module !== "undefined" && module !== null) {
    module.exports = Formbuilder;
  } else {
    window.Formbuilder = Formbuilder;
  }

}).call(this);

/*  注册表单字段  */

(function() {
	
	// 单行文本
	Formbuilder.registerField('text', {
		order: 0,
		view: "<input type='text' class='rf-size-large' placeholder='<%= rf.get(Formbuilder.options.mappings.PLACEHOLDER) %>' />",
		edit: "<%= Formbuilder.templates['edit/placeholder']() %> <%= Formbuilder.templates['edit/min_max_length']() %>",
		addButton: "<span class='symbol'><span class='fa fa-font'></span></span> 单行文本",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = "文本框";
			return attrs;
		}
	});
  
	// 多行文本
	Formbuilder.registerField('textarea', {
		order: 1,
		view: "<textarea class='rf-size-large' placeholder='<%= rf.get(Formbuilder.options.mappings.PLACEHOLDER) %>' ></textarea>",
		edit: "<%= Formbuilder.templates['edit/placeholder']() %> <%= Formbuilder.templates['edit/min_max_length']() %>",
		addButton: "<span class=\"symbol\">&#182;</span> 多行文本",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '文本框';
			return attrs;
		}
	});
	
	// 日期
	Formbuilder.registerField('date', {
		order: 10,
		view: "<input type=\"text\" class='rf-size-large' />",
		edit: "<%= Formbuilder.templates['edit/date-format']() %>",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-calendar\"></span></span> 日期",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '日期';
			attrs[Formbuilder.options.mappings.FORMAT] = 'yyyy-MM-dd';
			return attrs;
		}
	});
	
	// 日期时间
	Formbuilder.registerField('datetime', {
		order: 11,
		view: "<input type=\"text\" class='rf-size-large' />",
		edit: "<%= Formbuilder.templates['edit/date-format']() %>",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-calendar\"></span></span> 日期时间",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '日期时间';
			attrs[Formbuilder.options.mappings.FORMAT] = 'yyyy-MM-dd HH:mm:ss';
			return attrs;
		}
	});
	
	// 日期范围
	Formbuilder.registerField('daterange', {
		order: 12,
		view: "<div class='input-line'><label><%= rf.get(Formbuilder.options.mappings.STARTLABEL) %></label><input type=\"text\" /></div><div class='input-line'><label><%= rf.get(Formbuilder.options.mappings.ENDLABEL) %></label><input type=\"text\" /></div>",
		edit: "<%= Formbuilder.templates['edit/daterange']() %> <%= Formbuilder.templates['edit/date-format']() %>",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-calendar\"></span></span> 日期范围",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '';
			attrs[Formbuilder.options.mappings.STARTLABEL] = '开始日期';
			attrs[Formbuilder.options.mappings.ENDLABEL] = '结束日期';
			return attrs;
		}
	});
	
	// 数字
	Formbuilder.registerField('number', {
	    order: 30,
	    view: "<input type='text' /><% if (units = rf.get(Formbuilder.options.mappings.UNITS)) { %>  <%= units %><% } %>",
	    edit: "<%= Formbuilder.templates['edit/min_max']() %><%= Formbuilder.templates['edit/units']() %><%= Formbuilder.templates['edit/integer_only']() %>",
	    addButton: "<span class=\"symbol\"><span class=\"fa fa-number\">123</span></span> 数字框",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '数字';
			return attrs;
		}
	});
	
	// 金额
	Formbuilder.registerField('money', {
	    order: 31,
	    view: "<input type='text' /><% if (units = rf.get(Formbuilder.options.mappings.UNITS)) { %>  <%= units %><% } %>",
	    edit: "<%= Formbuilder.templates['edit/units']() %>",
	    addButton: "<span class=\"symbol\"><span class=\"fa fa-usd\"></span></span> 金额",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '金额';
			attrs[Formbuilder.options.mappings.UNITS] = '元';
			return attrs;
		}
	});

	// 单选框
	Formbuilder.registerField('select', {
		order: 40,
		view: "<% for (i in (rf.get(Formbuilder.options.mappings.OPTIONS) || [])) { %>  <div>    <label class='fb-option'>      <input type='radio' <%= rf.get(Formbuilder.options.mappings.OPTIONS)[i].checked && 'checked' %> onclick=\"javascript: return false;\" />      <%= rf.get(Formbuilder.options.mappings.OPTIONS)[i].label %>    </label>  </div><% } %><% if (rf.get(Formbuilder.options.mappings.INCLUDE_OTHER)) { %>  <div class='other-option'>    <label class='fb-option'>      <input type='radio' />      其它    </label>    <input type='text' />  </div><% } %>",
		edit: "<%= Formbuilder.templates['edit/options']({ includeOther: true }) %>",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-circle-o\"></span></span> 单选框",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '单选框';
			attrs.field_options.options = [
				{ label: "选项1", checked: false }, 
				{ label: "选项2", checked: false }
			];
			return attrs;
		}
	});
	
	// 复选框
	Formbuilder.registerField('multiselect', {
		order: 41,
		view: "<% for (i in (rf.get(Formbuilder.options.mappings.OPTIONS) || [])) { %>  <div>    <label class='fb-option'>      <input type='checkbox' <%= rf.get(Formbuilder.options.mappings.OPTIONS)[i].checked && 'checked' %> onclick=\"javascript: return false;\" />      <%= rf.get(Formbuilder.options.mappings.OPTIONS)[i].label %>    </label>  </div><% } %><% if (rf.get(Formbuilder.options.mappings.INCLUDE_OTHER)) { %>  <div class='other-option'>    <label class='fb-option'>      <input type='checkbox' />      其它    </label>    <input type='text' />  </div><% } %>",
		edit: "<%= Formbuilder.templates['edit/options']({ includeOther: true }) %>",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-square-o\"></span></span> 复选框",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '复选框';
			attrs.field_options.options = [
			    { label: "选项一", checked: true }, 
				{ label: "选项二", checked: false }
			];
			return attrs;
		}
	});

	// 清单项开始 table-begin
	Formbuilder.registerField('table-begin', {
		order: 50,
		view: "",
		edit: "",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-table\"></span></span> 清单开始",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '-----清单开始-----';
			return attrs;
		}
	})
	
	// 清单项开始 table-end
	Formbuilder.registerField('table-end', {
		order: 51,
		view: "<div style='text-align: center;'><input class='fb-button' type=\"button\" value=\"<%= rf.get(Formbuilder.options.mappings.ACTIONNAME) %>\" > </div>",
		edit: "<%= Formbuilder.templates['edit/table-action']() %>",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-table\"></span></span> 清单结束",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '-----清单结束-----';
			attrs[Formbuilder.options.mappings.ACTIONNAME] = '添加新项';
			return attrs;
		}
	})
	
	// 图片 
	Formbuilder.registerField('photo', {
		order: 60,
		view: "<input type='text' class='rf-size-large' />",
		edit: "",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-picture-o\"></span></span> 图片",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '图片';
			return attrs;
		}
	})
	
	// 附件 
	Formbuilder.registerField('attachment', {
		order: 61,
		view: "<input type='text' class='rf-size-large' />",
		edit: "",
		addButton: "<span class=\"symbol\"><span class=\"fa fa-file-o\"></span></span> 附件",
		defaultAttributes: function(attrs) {
			attrs[Formbuilder.options.mappings.LABEL] = '附件';
			return attrs;
		}
	})
	
	
}).call(this);

/*  注册字段编辑器  */

this["Formbuilder"] = this["Formbuilder"] || {};
this["Formbuilder"]["templates"] = this["Formbuilder"]["templates"] || {};

this["Formbuilder"]["templates"]["edit/base"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p +=
		((__t = ( Formbuilder.templates['edit/common']() )) == null ? '' : __t) +
		'' +
		((__t = ( Formbuilder.fields[rf.get(Formbuilder.options.mappings.FIELD_TYPE)].edit({rf: rf}) )) == null ? '' : __t) +
		'';
	}
	
	return __p
};

this["Formbuilder"]["templates"]["edit/base_non_input"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p +=
		((__t = ( Formbuilder.fields[rf.get(Formbuilder.options.mappings.FIELD_TYPE)].edit({rf: rf}) )) == null ? '' : __t) +
		'';
	}
	
	return __p
};

this["Formbuilder"]["templates"]["edit/checkboxes"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<label>  <input type="checkbox" data-rv-checked="model.' +
		((__t = ( Formbuilder.options.mappings.REQUIRED )) == null ? '' : __t) +
		'" />  必填项</label><!-- label>  <input type="checkbox" data-rv-checked="model.' +
		((__t = ( Formbuilder.options.mappings.ADMIN_ONLY )) == null ? '' : __t) +
		'" />  Admin only</label -->';
	}
	
	return __p
};

this["Formbuilder"]["templates"]["edit/common"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">标签</div><div class="fb-common-wrapper"> ' + 
		'<div class="fb-label-description">    ' +
		((__t = ( Formbuilder.templates['edit/label_description']() )) == null ? '' : __t) +
		'  </div>  <div class="fb-common-checkboxes">    ' +
		((__t = ( Formbuilder.templates['edit/checkboxes']() )) == null ? '' : __t) +
		'  </div>  <div class="fb-clear"></div></div>';
	}
	
	return __p
};

this["Formbuilder"]["templates"]["edit/date-format"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">日期格式</div><label> ' + 
		'<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.FORMAT )) == null ? '' : __t) +
		'" placeholder="yyyy-MM-dd hh:mm:ss" />';
	}
	
	return __p;
};


this["Formbuilder"]["templates"]["edit/table-action"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">按钮名称</div><label> ' + 
		'<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.ACTIONNAME )) == null ? '' : __t) +
		'" placeholder="请输入按钮名称" />';
	}
	
	return __p
};

// daterange
this["Formbuilder"]["templates"]["edit/daterange"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">起始标签</div><label> ' + 
		'<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.STARTLABEL )) == null ? '' : __t) +
		'" placeholder="开始日期标签" /> <input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.ENDLABEL )) == null ? '' : __t) +
		'" placeholder="结束日期标签" />';
	}
	
	return __p;
};


this["Formbuilder"]["templates"]["edit/integer_only"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">仅数字</div><label> ' + 
		'<input type="checkbox" data-rv-checked="model.' +
		((__t = ( Formbuilder.options.mappings.INTEGER_ONLY )) == null ? '' : __t) +
		'" />  仅接收数字内容</label>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["edit/placeholder"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">占位符</div>' + 
		'<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.PLACEHOLDER )) == null ? '' : __t) +
		'" placeholder="添加该字段占位符" />';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["edit/label_description"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.NAME )) == null ? '' : __t) +
		'" style="width:50%" placeholder="添加该字段名" /> 必填' +
		'<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.LABEL )) == null ? '' : __t) +
		'" placeholder="添加该字段标题" /><textarea data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.DESCRIPTION )) == null ? '' : __t) +
		'"  placeholder="添加该字段描述"></textarea>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["edit/min_max"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">最小值 / 最大值</div>' + 
		'大于<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.MIN )) == null ? '' : __t) +
		'" style="width: 30px" />&nbsp;&nbsp;' + 
		'小于<input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.MAX )) == null ? '' : __t) +
		'" style="width: 30px" />';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["edit/min_max_length"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">长度限制</div><div>最小: <input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.MINLENGTH )) == null ? '' : __t) +
		'" style="width: 30px" /></div><div>最大: <input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.MAXLENGTH )) == null ? '' : __t) +
		'" style="width: 30px" /></div><div>限制类型: <select data-rv-value="model.' +
		((__t = ( Formbuilder.options.mappings.LENGTH_UNITS )) == null ? '' : __t) +
		'" style="width: auto;">  <option value="characters">字节</option>  <option value="words">字符</option></select></div>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["edit/options"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
	
	function print() { __p += __j.call(arguments, '') }
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">选项</div>';
		
		if (typeof includeBlank !== 'undefined') {
			__p += '  <label>    <input type="checkbox" data-rv-checked="model.' +
			((__t = ( Formbuilder.options.mappings.INCLUDE_BLANK )) == null ? '' : __t) +
			'" />    包含空白项  </label>';
		}
		
		__p += '<div class="option" data-rv-each-option="model.' +
		((__t = ( Formbuilder.options.mappings.OPTIONS )) == null ? '' : __t) + '"> ' +
		'<input type="checkbox" class="js-default-updated" data-rv-checked="option:checked" /> ' + 
		'<input type="text" data-rv-input="option:value" class="option-value-input" />  ' + 
		'<input type="text" data-rv-input="option:label" class="option-label-input" />  ' + 
		'<a class="js-add-option ' +
		((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		'" title="添加新项"><i class="fa fa-plus-circle"></i></a>  <a class="js-remove-option ' +
		((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		'" title="移除此项"><i class="fa fa-minus-circle"></i></a></div>';
		
		if (typeof includeOther !== 'undefined'){
			__p += '  <label>    <input type="checkbox" data-rv-checked="model.' +
			((__t = ( Formbuilder.options.mappings.INCLUDE_OTHER )) == null ? '' : __t) +
			'" />    包含 "其它"  </label>';
		}
		
		__p += '<div class="fb-bottom-add">  <a class="js-add-option ' +
		((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		'">添加项</a></div>';
	}
	return __p;
};

this["Formbuilder"]["templates"]["edit/size"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">大小</div><select data-rv-value="model.' +
			((__t = ( Formbuilder.options.mappings.SIZE )) == null ? '' : __t) +
			'">  <option value="small">最小</option>  <option value="medium">中等</option>' + 
			'<option value="large">最大</option></select>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["edit/units"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-edit-section-header">单位</div><input type="text" data-rv-input="model.' +
		((__t = ( Formbuilder.options.mappings.UNITS )) == null ? '' : __t) +
		'" />';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["page"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p +=
		((__t = ( Formbuilder.templates['partials/save_button']() )) == null ? '' : __t) +
		'' +
		((__t = ( Formbuilder.templates['partials/left_side']() )) == null ? '' : __t) +
		'' +
		((__t = ( Formbuilder.templates['partials/center_side']() )) == null ? '' : __t) +
		'' +
		((__t = ( Formbuilder.templates['partials/right_side']() )) == null ? '' : __t) +
		'<div class="fb-clear"></div>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["partials/add_field"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
	
	function print() { __p += __j.call(arguments, '') }
	
	with (obj) {
		__p += '<div class="fb-tab-pane active" id="addField">  <div class="fb-add-field-types">    <div class="section">      ';
		 _.each(_.sortBy(Formbuilder.inputFields, 'order'), function(f){ ;
		__p += '        <a data-field-type="' +
		((__t = ( f.field_type )) == null ? '' : __t) +
		'" class="' +
		((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		'">          ' +
		((__t = ( f.addButton )) == null ? '' : __t) +
		'        </a>      ';
		 }); ;
		__p += '    </div>    <div class="section">      ';
		 _.each(_.sortBy(Formbuilder.nonInputFields, 'order'), function(f){ ;
		__p += '        <a data-field-type="' +
		((__t = ( f.field_type )) == null ? '' : __t) +
		'" class="' +
		((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		'">          ' +
		((__t = ( f.addButton )) == null ? '' : __t) +
		'        </a>      ';
		 }); ;
		__p += '    </div>  </div></div>';
	}
	return __p;
};

this["Formbuilder"]["templates"]["partials/edit_field"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-tab-pane" id="editField">  <div class="fb-edit-field-wrapper"></div></div>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["partials/left_side"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-left">  <ul class="fb-tabs">    <li class="active"><a data-target="#addField">添加新字段</a></li></ul>  <div class="fb-tab-content">    ' +
		((__t = ( Formbuilder.templates['partials/add_field']() )) == null ? '' : __t) +
		'  </div></div>';
	}
	
	return __p;
};

// 中间
this["Formbuilder"]["templates"]["partials/center_side"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-center">  <div class="fb-no-response-fields">没有定义任何字段</div>  <div class="fb-response-fields"></div></div>';
	}
	return __p;
};

// 右边
this["Formbuilder"]["templates"]["partials/right_side"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-right">  <ul class="fb-tabs">    <li class="active"><a data-target="#editField">编辑字段</a></li>  </ul>  <div class="fb-tab-content">    ' +
		((__t = ( Formbuilder.templates['partials/edit_field']() )) == null ? '' : __t) +
		'  </div></div>';
	}
	
	return __p
};

this["Formbuilder"]["templates"]["partials/save_button"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="fb-save-wrapper">  <button class="js-save-form ' +
		((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		'"></button></div>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["view/base"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<div class="subtemplate-wrapper">  <div class="cover"></div>  ' +
		((__t = ( Formbuilder.templates['view/label']({rf: rf}) )) == null ? '' : __t) +
		'  ' +
		((__t = ( Formbuilder.fields[rf.get(Formbuilder.options.mappings.FIELD_TYPE)].view({rf: rf}) )) == null ? '' : __t) +
		'  ' +
		((__t = ( Formbuilder.templates['view/description']({rf: rf}) )) == null ? '' : __t) +
		'  ' +
		((__t = ( Formbuilder.templates['view/duplicate_remove']({rf: rf}) )) == null ? '' : __t) +
		'</div>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["view/base_non_input"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '' + 
		((__t = ( Formbuilder.templates['view/label']({rf: rf}) )) == null ? '' : __t) +
		'  ' +
		((__t = ( Formbuilder.fields[rf.get(Formbuilder.options.mappings.FIELD_TYPE)].view({rf: rf}) )) == null ? '' : __t) +
		'  ';
	}
	return __p;
};

this["Formbuilder"]["templates"]["view/description"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		__p += '<span class="help-block">  ' +
		((__t = ( Formbuilder.helpers.simple_format(rf.get(Formbuilder.options.mappings.DESCRIPTION)) )) == null ? '' : __t) +
		'</span>';
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["view/duplicate_remove"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape;
	
	with (obj) {
		
		//__p += '<div class="actions-wrapper">  <a class="js-duplicate ' +
		//((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		//'" title="Duplicate Field"><i class="fa fa-plus-circle"></i></a>  <a class="js-clear ' +
		//((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		//'" title="Remove Field"><i class="fa fa-minus-circle"></i></a></div>';
		
		__p += '<div class="actions-wrapper"> <a class="js-clear ' +
		((__t = ( Formbuilder.options.BUTTON_CLASS )) == null ? '' : __t) +
		'" title="Remove Field"><i class="fa fa-minus-circle"></i></a></div>';
	
	}
	
	return __p;
};

this["Formbuilder"]["templates"]["view/label"] = function(obj) {
	
	obj || (obj = {});
	var __t, __p = '', __e = _.escape, __j = Array.prototype.join;
	
	function print() { __p += __j.call(arguments, '') }
	
	with (obj) {
		__p += '<label>  <span>' +
		((__t = ( Formbuilder.helpers.simple_format(rf.get(Formbuilder.options.mappings.LABEL)) )) == null ? '' : __t) +
		'  ';
		 if (rf.get(Formbuilder.options.mappings.REQUIRED)) { ;
		__p += '    <abbr title="required">必填</abbr>  ';
		 } ;
		__p += '</label>';
	}
	return __p;
};
