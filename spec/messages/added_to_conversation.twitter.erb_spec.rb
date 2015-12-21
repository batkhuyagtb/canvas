#
# Copyright (C) 2011 Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')
require File.expand_path(File.dirname(__FILE__) + '/messages_helper')

describe 'added_to_conversation.twitter' do
  it "should render" do
    course_with_teacher
    student1 = student_in_course.user
    student2 = student_in_course.user
    student3 = student_in_course.user
    conversation = @teacher.initiate_conversation([student1, student2])
    conversation.add_message("some message")
    event = conversation.add_participants([student3])
    generate_message(:added_to_conversation, :twitter, event)
    expect(@message.main_link).to be_present
    expect(@message.body).to be_present
  end
end
