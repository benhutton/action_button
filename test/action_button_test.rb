require File.dirname(__FILE__) + '/test_helper'

class ActionButtonTest < ActiveSupport::TestCase
  
  context 'a button tag with some properties' do
      
    setup do
      @button = button_tag 'action', 'Do this', 'submit', :value => 1
    end

    should 'set the name' do
      assert_tag_in @button, :button, :attributes => {:name => 'action'}
    end

    should 'set the type' do
      assert_tag_in @button, :button, :attributes => {:type => 'submit'}
    end
    
    should 'set the content' do
      assert_tag_in @button, :button, :content => 'Do this'
    end

    should 'set the value' do
      assert_tag_in @button, :button, :attributes => {:value => '1'}
    end

    teardown do
      @button = nil
    end
    
  end
  
  context 'an action button with no options' do
    setup do
      @button = action_button 'action', 'Do this', 'http://www.example.com/action.do'
    end
    
    should 'have a form with url, and auto id and name' do
      assert_tag_in @button, :form, :attributes => {:id => 'action-form',
                                                    :class => 'action-form',
                                                    :action => 'http://www.example.com/action.do'}
    end
    
    should 'have a button with id, name, class, type, and content' do
      assert_tag_in @button, :button, :content => 'Do this', :attributes => { :id => 'action', 
                                                                              :name => 'action',
                                                                              :class => 'action',
                                                                              :type => 'submit' }
    end
    
    teardown do
      @button = nil
    end
  end
  
  context 'an action button with url options' do
    setup do
      @controller = stub(:url_for => '/blog/show/5')
      @button = action_button 'action', 'Do this', :controller => 'blog', :action => 'show', :id => 5
    end
    
    should 'have a form with url, and auto id and name' do
      assert_tag_in @button, :form, :attributes => {:id => 'action5-form', :class => 'action-form'}
    end
    
    should 'have a button with id, name, class, type, and content' do
      assert_tag_in @button, :button, :content => 'Do this', :attributes => { :id => 'action5',
                                                                              :name => 'action5',
                                                                              :class => 'action',
                                                                              :type => 'submit' }
    end
    
    teardown do
      @button = nil
    end
  end
  
  context 'an action button with html options' do
    setup do
      @button = action_button 'action', 'Do this', 'http://www.example.com/action.do',
                              :id => 'button5', :class => 'do', :method => 'delete'
    end
    
    should 'have a form with url, and auto id and name' do
      assert_tag_in @button, :form, :attributes => { :id => 'button5-form',
                                                     :class => 'do-form',
                                                     :action => 'http://www.example.com/action.do' }
    end
    
    should 'have a button with id, name, class, type, and content' do
      assert_tag_in @button, :button, :content => 'Do this', :attributes => { :id => 'button5',
                                                                              :name => 'button5',
                                                                              :class => 'do',
                                                                              :type => 'submit'}
    end
    
    teardown do
      @button = nil
    end
  end
  
  context 'an action button with form html options' do
    setup do
      @button = action_button 'action', 'Do this', 'http://www.example.com/action.do',
                              :form_id => 'doThisForm', :form_class => 'doForm'
    end
    
    should 'have a form with url, and auto id and name' do
      assert_tag_in @button, :form, :attributes => { :id => 'doThisForm',
                                                     :class => 'doForm',
                                                     :action => 'http://www.example.com/action.do' }
    end
    
    should 'have a button with id, name, class, type, and content' do
      assert_tag_in @button, :button, :content => 'Do this', :attributes => { :id => 'action',
                                                                              :name => 'action',
                                                                              :class => 'action',
                                                                              :type => 'submit' }
    end
    
    teardown do
      @button = nil
    end
  end
  
  context 'an action button with special optoins' do
    setup do
      @button = action_button 'action', 'Do this', 'http://www.example.com/action.do',
                              :wrapper_tag => :div, :number => 5
    end
    
    should 'have a form with url, and auto id and name' do
      assert_tag_in @button, :form, :attributes => { :id => 'action5-form',
                                                     :class => 'action-form',
                                                     :action => 'http://www.example.com/action.do' }
    end
    
    should 'have a button with id, name, class, type, and content' do
      assert_tag_in @button, :div, :child => { :tag => 'button',
                                               :content => 'Do this',
                                               :attributes => { :id => 'action5',
                                                                :name => 'action5',
                                                                :class => 'action',
                                                                :type => 'submit' } }
    end
    
    teardown do
      @button = nil
    end
  end
    
end
