import 'package:dio/dio.dart';

class ApplyToJobModel {
  int? jobId;
  int? cvId;
  MultipartFile? cv;

  ApplyToJobModel({
    this.jobId,
    this.cvId,
    this.cv,
  });

  ApplyToJobModel copyWith({
    int? jobId,
    int? cvId,
    MultipartFile? cv,
  }) {
    return ApplyToJobModel(
      jobId: jobId ?? this.jobId,
      cvId: cvId ?? this.cvId,
      cv: cv ?? this.cv,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'job_id': jobId,
      if(cvId != null)
      'job_cv_id': cvId,
      if(cv != null)
      'getCv': cv,
    };
  }

  @override
  String toString() => 'ApplyToJobModel(jobId: $jobId, cvId: $cvId, getCv: $cv)';

  @override
  bool operator ==(covariant ApplyToJobModel other) {
    if (identical(this, other)) return true;

    return other.jobId == jobId && other.cvId == cvId && other.cv == cv;
  }

  @override
  int get hashCode => jobId.hashCode ^ cvId.hashCode ^ cv.hashCode;
}
