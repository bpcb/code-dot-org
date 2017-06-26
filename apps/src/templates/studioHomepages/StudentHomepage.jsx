import React from 'react';
import ReactDOM from 'react-dom';
import HeaderBanner from '../HeaderBanner';
import RecentCourses from './RecentCourses';
import Sections from './Sections';
import StudentResources from './StudentResources';
import shapes from './shapes';
import ProtectedStatefulDiv from '../ProtectedStatefulDiv';
import i18n from "@cdo/locale";

const styles = {
  userHero: {
    paddingTop: 10
  }
};

const StudentHomepage = React.createClass({
  propTypes: {
    courses: shapes.courses,
    sections: shapes.sections,
    isRtl: React.PropTypes.bool.isRequired,
    canLeave: React.PropTypes.bool.isRequired
  },

  componentDidMount() {
    // The component used here is implemented in legacy HAML/CSS rather than React.
    $('#user_hero').appendTo(ReactDOM.findDOMNode(this.refs.userHero)).show();
  },

  render() {
    const { courses, sections, isRtl, canLeave } = this.props;

    return (
      <div>
        <HeaderBanner
          headingText={i18n.homepageHeading()}
        />

        <ProtectedStatefulDiv
          style={styles.userHero}
          ref="userHero"
        />

        <RecentCourses
          courses={courses}
          showAllCoursesLink={true}
          header={i18n.recentCourses()}
          isRtl={isRtl}
        />

        <Sections
          sections={sections}
          isRtl={isRtl}
          isTeacher={false}
          canLeave={canLeave}
        />

        <StudentResources/>

      </div>
    );
  }
});

export default StudentHomepage;
