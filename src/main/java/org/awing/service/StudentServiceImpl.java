package org.awing.service;

import org.awing.dao.StudentDao;
import org.awing.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * StudentService 的实现类
 *
 * @author:
 * @create:
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    StudentDao studentDao;

    public int getTotal() {
        return studentDao.getTotal();
    }

    public void addStudent(Student student) {
        studentDao.addStudent(student);
    }

    public void deleteStudent(int id) {
        studentDao.deleteStudent(id);
    }

    public void updateStudent(Student student) {
        studentDao.updateStudent(student);
    }

    public Student getStudent(int id) {
        return studentDao.getStudent(id);
    }

    public List<Student> list(int start, int count) {
        return studentDao.list(start, count);
    }
}