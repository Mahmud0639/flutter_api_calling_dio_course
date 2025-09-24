class ResponseInListStudents {
  int? studentId;
  String? name;
  String? email;
  String? phone;
  String? profileId;
  String? projectTitle;
  String? projectDesc;
  String? imageUrl;
  int? totalCredits;
  Departments? departments;
  List<Subjects>? subjects;

  ResponseInListStudents(
      {this.studentId,
        this.name,
        this.email,
        this.phone,
        this.profileId,
        this.projectTitle,
        this.projectDesc,
        this.imageUrl,
        this.totalCredits,
        this.departments,
        this.subjects});

  ResponseInListStudents.fromJson(Map<String, dynamic> json) {
    studentId = json['student_id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    profileId = json['profile_id'];
    projectTitle = json['project_title'];
    projectDesc = json['project_desc'];
    imageUrl = json['imageUrl'];
    totalCredits = json['total_credits'];
    departments = json['departments'] != null
        ? new Departments.fromJson(json['departments'])
        : null;
    if (json['subjects'] != null) {
      subjects = <Subjects>[];
      json['subjects'].forEach((v) {
        subjects!.add(new Subjects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['student_id'] = this.studentId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['profile_id'] = this.profileId;
    data['project_title'] = this.projectTitle;
    data['project_desc'] = this.projectDesc;
    data['imageUrl'] = this.imageUrl;
    data['total_credits'] = this.totalCredits;
    if (this.departments != null) {
      data['departments'] = this.departments!.toJson();
    }
    if (this.subjects != null) {
      data['subjects'] = this.subjects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Departments {
  int? deptId;
  String? deptName;

  Departments({this.deptId, this.deptName});

  Departments.fromJson(Map<String, dynamic> json) {
    deptId = json['dept_id'];
    deptName = json['dept_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dept_id'] = this.deptId;
    data['dept_name'] = this.deptName;
    return data;
  }
}

class Subjects {
  int? subjectId;
  String? subjectName;

  Subjects({this.subjectId, this.subjectName});

  Subjects.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    subjectName = json['subject_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['subject_name'] = this.subjectName;
    return data;
  }
}
