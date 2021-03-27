package com.dungeonmaster.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.dungeonmaster.entity.Note;

public interface NoteRepository extends JpaRepository<Note, Long> {

}
