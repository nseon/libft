NAME = libft.a

SRC = ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c ft_strlen.c \
ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_strlcpy.c ft_strlcat.c ft_toupper.c \
ft_tolower.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c ft_memcmp.c \
ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c \
ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c ft_putchar_fd.c \
ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

SRC_BNS = $(SRC) ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
ft_lstlast_bonus.c ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c \
ft_lstiter_bonus.c ft_lstmap_bonus.c

OBJ = $(SRC:.c=.o)
OBJ_BNS = $(SRC_BNS:.c=.o)

DEP = $(SRC_BNS:.c=.d)

MODE ?=
MODETRACE = .mt
LASTMODE = $(shell cat $(MODETRACE) 2>/dev/null)

CC = cc
CPPFLAGS = -MMD -MP
CFLAGS = -Wall -Werror -Wextra

ifneq ($(MODE), $(LASTMODE))
$(NAME): force
endif

all : $(NAME)

$(NAME) : $(OBJ)
	echo $(MODE) > $(MODETRACE)
	ar -rcs $@ $(OBJ)

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

-include $(DEP)

bonus :
	$(MAKE) SRC="$(SRC_BNS)" MODE=$@

clean :
	rm -f $(OBJ_BNS) $(DEP)

fclean : clean
	rm -f $(NAME)

force:

re : fclean all

.PHONY: bonus all clean fclean re force
