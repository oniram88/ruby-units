require File.dirname(__FILE__) + '/../spec_helper'

describe String do
  context "Unit creation from strings" do
    specify { "1 mm".to_unit.should be_instance_of Unit }
    specify { "1 mm".unit.should be_instance_of Unit }
    specify { "1 mm".u.should be_instance_of Unit }
    specify { "1 m".to("ft").should be_within(Unit("0.01 ft")).of Unit("3.28084 ft") }
  end
  
  context "Time syntax sugar" do
    
    specify { "5 min".ago.should be_instance_of Time }
    
    specify { "5 min".from.should be_instance_of Time }
    specify { "5 min".from('now').should be_instance_of Time }
#    specify { "5 min".from(Time.now.to_i).should be_instance_of Time }
    specify { "5 min".from_now.should be_instance_of Time }
    
    specify { "5 min".after('12:00').should be_instance_of Time }
    
    specify { "5 min".before.should be_instance_of Time}
    specify { "5 min".before('now').should be_instance_of Time}
    specify { "5 min".before_now.should be_instance_of Time}
    specify { "5 min".before('12:00').should be_instance_of Time}
    
    specify { "min".since.should be_instance_of Unit}
    specify { "min".since("12:00").should be_instance_of Unit}

    specify { "min".until.should be_instance_of Unit}
    specify { "min".until("12:00").should be_instance_of Unit}
    
    specify { "today".to_date.should be_instance_of Date }
    specify { "2011-4-1".to_date.should be_instance_of Date }

    specify { "now".to_datetime.should be_instance_of DateTime }
    specify { "now".to_time.should be_instance_of Time }
    
    if RUBY_VERSION < "1.9" && RUBY_PLATFORM != 'java'
      specify {"10001-01-01 12:00".time.should be_instance_of DateTime }
    else
      specify { "10001-01-01 12:00".time.should be_instance_of Time }
    end
    specify { "2001-01-01 12:00".time.should be_instance_of Time }
    
  end
end