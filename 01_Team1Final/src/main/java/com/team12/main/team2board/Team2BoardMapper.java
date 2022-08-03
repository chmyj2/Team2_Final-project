package com.team12.main.team2board;

import java.util.List;

public interface Team2BoardMapper {

	int getAllpostCount(Team2BoardDTO board);

	List<Team2BoardDTO> getPostList(Team2BoardDTO board);



}
